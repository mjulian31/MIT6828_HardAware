#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <cuda.h>
#include <cuda_runtime.h>
#include <nvrtc.h>
#include <builtin_types.h>

/**
 * Host main routine
 */
int main(int argc, char **argv) {
  CUmodule module;
  cuModuleLoad(&module, "matmul_gpu.ptx");

  CUfunction kernel_addr;
  cuModuleGetFunction(&kernel_addr, module, "_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32");

  // Print the vector length to be used, and compute its size
  int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
  size_t size = dim * dim * sizeof(double);
  printf("[dim %d]\n", dim);

  // Allocate the host input matrix A
  float *h_A = reinterpret_cast<float *>(malloc(size));

  // Allocate the host input matrix B
  float *h_B = reinterpret_cast<float *>(malloc(size));

  // Allocate the host output matrix output
  float *h_output = reinterpret_cast<float *>(malloc(size));

  // Verify that allocations succeeded
  if (h_A == NULL || h_B == NULL || h_output == NULL) {
    fprintf(stderr, "Failed to allocate host vectors!\n");
    exit(EXIT_FAILURE);
  }

  // Initialize the host input vectors
  for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
      h_A[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      h_B[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      h_output[dim*i + j] = 0;
    }
  }

  // Allocate the device input vector A
  CUdeviceptr d_A;
  cuMemAlloc(&d_A, size);

  // Allocate the device input vector B
  CUdeviceptr d_B;
  cuMemAlloc(&d_B, size);

  // Allocate the device output vector C
  CUdeviceptr d_output;
  cuMemAlloc(&d_output, size);

  // Copy the host input vectors A and B in host memory to the device input
  // vectors in device memory
  printf("Copy input data from the host memory to the CUDA device\n");
  cuMemcpyHtoD(d_A, h_A, size);
  cuMemcpyHtoD(d_B, h_B, size);

  // Launch the Vector Add CUDA Kernel
  int threadsPerBlock = 32;
  int blocksPerGrid = dim/threadsPerBlock;
  printf("CUDA kernel launch with %d blocks of %d threads\n", blocksPerGrid,
         threadsPerBlock);
  dim3 cudaBlockSize(threadsPerBlock, threadsPerBlock, 1);
  dim3 cudaGridSize(blocksPerGrid, blocksPerGrid, 1);

  void *arr[] = {reinterpret_cast<double *>(&d_A), reinterpret_cast<double *>(&d_B),
                 reinterpret_cast<double *>(&d_output),
                 reinterpret_cast<int *>(&dim)};
  printf("launching kernel\n");
  cuLaunchKernel(kernel_addr, cudaGridSize.x, cudaGridSize.y,
                                 cudaGridSize.z, /* grid dim */
                                 cudaBlockSize.x, cudaBlockSize.y,
                                 cudaBlockSize.z, /* block dim */
                                 0, 0,            /* shared mem, stream */
                                 &arr[0],         /* arguments */
                                 0);
  cuCtxSynchronize();
  printf("done\n");
  // Copy the device result vector in device memory to the host result vector
  // in host memory.
  printf("Copy output data from the CUDA device to the host memory\n");
  cuMemcpyDtoH(h_output, d_output, size);

  for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
      if (h_output[dim*i + j] == 0) {
        // printf("error with output\n");
      }
    }
  }

  // Free device global memory
  cuMemFree(d_A);
  cuMemFree(d_B);
  cuMemFree(d_output);

  // Free host memory
  free(h_A);
  free(h_B);
  free(h_output);

  printf("Done\n");

  return 0;
}
