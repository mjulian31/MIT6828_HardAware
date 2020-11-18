#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

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
			h_A[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      h_B[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      h_output[dim*i + j] = 0;
    }
  }
	matmul(output, A, B, dim);
	for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
      if (h_output[dim*i + j] == 0) {
        printf("error with output\n");
      }
    }
  }
	free(A);
	free(B);
	free(output);
}
