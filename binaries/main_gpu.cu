#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime.h>

extern __global__ void _Z38julia_coalesced_matmul_kernelNOT__393513CuDeviceArrayI7Float32Li2ELi1EES_IS0_Li2ELi1EES_IS0_Li2ELi1EE(double* out, double* A, double* B, int dim);

int main(int argc, char *argv[]) {
	int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
	double* A = malloc(sizeof(double) * dim * dim);
	double* B = malloc(sizeof(double) * dim * dim);
	double* output = malloc(sizeof(double) * dim * dim);
  double *d_A, *d_B, *d_output;
	cudaMalloc((void **)&A, sizeof(double) * dim * dim);
	cudaMalloc((void **)&B, sizeof(double) * dim * dim);
	cudaMalloc((void **)&output, sizeof(double) * dim * dim);
  cudaMemcpy(d_A, A, dim*dim, cudaMemcpyHostToDevice);
  cudaMemcpy(d_B, B, dim*dim, cudaMemcpyHostToDevice);
	_Z38julia_coalesced_matmul_kernelNOT__393513CuDeviceArrayI7Float32Li2ELi1EES_IS0_Li2ELi1EES_IS0_Li2ELi1EE<<<dim, dim>>>(output, A, B, dim);
  cudaDeviceSynchronize();
  cudaMemcpy(output, d_output, dim*dim, cudaMemcpyDeviceToHost);
  cudaFree(d_A);
  cudaFree(d_B);
  cudaFree(d_output);
	free(A);
	free(B);
	free(C);
}
