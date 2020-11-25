#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void matmul(double* out, double* A, double* B, int N, int R, int M);

#ifdef ERR_CHECK
void basic_matmul(double* out, double* A, double* B, int N, int R, int M) {
	for (int i = 0; i < N; ++i) {
		for (int j = 0; j < M; ++j) {
			for (int k = 0; k < R; ++k) {
				out[i*M + j] += A[k*N + i] * B[j*R + k];
			}
		}
	}
}
#endif

int main(int argc, char *argv[]) {
	int N = 1024;
	int R = 1024;
	int M = 1024;
	if (argc >= 4) {
		N = atoi(argv[1]);
		R = atoi(argv[2]);
		M = atoi(argv[3]);
	} else if (argc >- 2) {
		N = atoi(argv[1]);
		R = N;
		M = N;
	}
	printf("[dims %dx%d %dx%d -> %dx%d]\n", N, R, R, M, N, M);

	// alloc mem
	double* A = malloc(sizeof(double) * N * R);
	double* B = malloc(sizeof(double) * R * M);
	double* output = malloc(sizeof(double) * N * M);
	#ifdef ERR_CHECK
	double* output_check = malloc(sizeof(double) * N * M);
	#endif

	// init arrays
  for (int col = 0; col < R; ++col) {
		for (int row = 0; row < N; ++row) {
			A[N*col + row] = rand() / (double)(RAND_MAX);
    }
  }
	for (int col = 0; col < M; ++col) {
    for (int row = 0; row < R; ++row) {
      B[R*col + row] = rand() / (double)(RAND_MAX);
    }
  }
	for (int col = 0; col < M; ++col) {
    for (int row = 0; row < N; ++row) {
			output[N*col + row] = 0;
			#ifdef ERR_CHECK
			output_check[N*col + row] = 0;
			#endif
    }
  }

	// call kernel
	matmul(output, A, B, N, R, M);

	// error check
	#ifdef ERR_CHECK
	basic_matmul(output_check, A, B, N, R, M);
	int count = 0;
	for (int i = 0; i < N; ++i) {
    for (int j = 0; j < M; ++j) {
      if (fabs(output[N*j + i] - output_check[M*i + j]) > 1e-9) {
        count += 1;
      }
    }
  }
	if (count > 0) fprintf(stderr, "%i wrong of %i\n", count, N*M);
	else printf("all good!\n");
	#endif

	// free mem
	free(A);
	free(B);
	free(output);

	return 0;
}
