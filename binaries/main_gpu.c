#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

extern __global__ void matmul(double* out, double* A, double* B, int dim);

int main(int argc, char *argv[]) {
	int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
  double *A, *B, *output;
  double *d_A, *d_B, *d_output;
	cudaMalloc((void **)&A, sizeof(double) * dim * dim);
	cudaMalloc((void **)&B, sizeof(double) * dim * dim);
	cudaMalloc((void **)&output, sizeof(double) * dim * dim);
  cudaMemcpy(d_A, A, dim*dim, cudaMemcpyHostToDevice);
  cudaMemcpy(d_B, B, dim*dim, cudaMemcpyHostToDevice);
	matmul<<<dim, dim>>>(output, A, B, dim);
  cudaMemcpy(output, d_output, dim*dim, cudaMemcpyDeviceToHost);
  cudaFree(d_A);
  cudaFree(d_B);
  cudaFree(d_output);
}
