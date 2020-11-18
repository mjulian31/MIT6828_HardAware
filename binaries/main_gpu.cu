#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime.h>

extern "C" __device__ void _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32(double* out, double* A, double* B, int dim);

__global__ void __matmul(double* out, double* A, double* B, int dim) {
	_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32(output, A, B, dim);
}

int main(int argc, char *argv[]) {
	int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
	double* A = (double*)malloc(sizeof(double) * dim * dim);
	double* B = (double*)malloc(sizeof(double) * dim * dim);
	double* output = (double*)malloc(sizeof(double) * dim * dim);
  double *d_A, *d_B, *d_output;
	cudaMalloc((void **)&d_A, sizeof(double) * dim * dim);
	cudaMalloc((void **)&d_B, sizeof(double) * dim * dim);
	cudaMalloc((void **)&d_output, sizeof(double) * dim * dim);
  cudaMemcpy(d_A, A, dim*dim, cudaMemcpyHostToDevice);
  cudaMemcpy(d_B, B, dim*dim, cudaMemcpyHostToDevice);
	__matmul<<<dim, dim>>>(output, A, B, dim);
  cudaDeviceSynchronize();
  cudaMemcpy(output, d_output, dim*dim, cudaMemcpyDeviceToHost);
  cudaFree(d_A);
  cudaFree(d_B);
  cudaFree(d_output);
	free(A);
	free(B);
	free(output);
}
