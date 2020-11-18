#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void matmul(double* out, double* A, double* B, int dim);

int main(int argc, char *argv[]) {
	int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}

	// alloc mem
	double* A = malloc(sizeof(double) * dim * dim);
	double* B = malloc(sizeof(double) * dim * dim);
	double* output = malloc(sizeof(double) * dim * dim);

	// init arrays
	for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
			A[dim*i + j] = rand() / (double)(RAND_MAX);
      B[dim*i + j] = rand() / (double)(RAND_MAX);
    }
  }

	// call kernel
	matmul(output, A, B, dim);

	// error check
	// for (int i = 0; i < dim; ++i) {
  //   for (int j = 0; j < dim; ++j) {
  //     if (output[dim*i + j] == 0) {
  //       printf("error with output\n");
  //     }
  //   }
  // }

	// free mem
	free(A);
	free(B);
	free(output);
}
