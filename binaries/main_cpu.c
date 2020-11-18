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
	matmul(output, A, B, dim);
}
