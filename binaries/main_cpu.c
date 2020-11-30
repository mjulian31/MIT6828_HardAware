#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


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


/**
 *load matrix from string of the form [1 2 3; 4 5 6] of size NxM
 *returns the double* to the col-major stored matrix
 */
double* load_matrix(char* matrix_string, int N, int M) {
  char *str1, *str2, *line, *elem;
  char *saveptr1, *saveptr2;
  double* matrix = reinterpret_cast<double *>(malloc(sizeof(double) * N * M));

  int col = 0;
  int row = 0;

  str1 = matrix_string;
  for (int j = 1; ; j++) {
    line = strtok_r(str1, "[];", &saveptr1);
    str1 = NULL;
    if (line == NULL)
      break;

    str2 = line;
    row = 0;
    while (true) {
      elem = strtok_r(str2, " ", &saveptr2);
      str2 = NULL;
      if (elem == NULL)
        break;

      matrix[col*N + row] = atoi(elem);
      row ++;
    }

    col ++;
  }

  return matrix;
}


int main(int argc, char *argv[]) {
	int N = 1024;
	int R = 1024;
	int M = 1024;
  char* matstringA = NULL;
  char* matstringB = NULL;
  bool rand = true;

  if (argc >= 6) {
    rand = false;
    N = atoi(argv[1]);
		R = atoi(argv[2]);
		M = atoi(argv[3]);
    matstringA = argv[4];
    matstringB = argv[5];
  } else if (argc >= 4) {
		N = atoi(argv[1]);
		R = atoi(argv[2]);
		M = atoi(argv[3]);
	} else if (argc >= 2) {
		N = atoi(argv[1]);
		R = N;
		M = N;
	}
	printf("[dims %dx%d %dx%d -> %dx%d]\n", N, R, R, M, N, M);

	// alloc mem
	double* A;
	double* B;
	double* output = malloc(sizeof(double) * N * M);
	#ifdef ERR_CHECK
	double* output_check = malloc(sizeof(double) * N * M);
	#endif

	// init arrays
	if (rand) {
		A = malloc(sizeof(double) * N * R);
		B = malloc(sizeof(double) * R * M);

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
	} else {
		A = load_matrix(matstringA, N, R);
		B = load_matrix(matstringB, R, M);
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
