#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <cmath>

void matmul(double* out, double* A, double* B, int dim);

int main(int argc, char *argv[]) {
	int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
	double* A = malloc(sizeof(double) * dim * dim);
	double* B = malloc(sizeof(double) * dim * dim);
	double* output = malloc(sizeof(double) * dim * dim);
	for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
			A[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      B[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      output[dim*i + j] = 0;
    }
  }
	matmul(output, A, B, dim);
	for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
      if (output[dim*i + j] == 0) {
        printf("error with output\n");
      }
    }
  }
	free(A);
	free(B);
	free(output);
}
