#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

void matmul(double* out, double* A, double* B, int dim);

int main(int argc, char *argv[]) {
	int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
  double* A, B, output;
	cudaMalloc(&A, sizeof(double) * dim * dim);
	cudaMalloc(&B, sizeof(double) * dim * dim);
	cudaMalloc(&output, sizeof(double) * dim * dim);
	matmul(output, A, B, dim);
}
