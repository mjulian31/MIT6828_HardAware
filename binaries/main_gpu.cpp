#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <cuda.h>
#include <cuda_runtime.h>
#include <nvrtc.h>
#include <builtin_types.h>
#include <string>

static inline void check_errors(CUresult res, std::string name) {
  if (res != CUDA_SUCCESS) {
    fprintf(stderr, "cuda failure %i at %s!\n", res, name.c_str());
    exit(EXIT_FAILURE);
  }
}

/**
 * Host main routine
 */
int main(int argc, char **argv) {
  // init driver
  check_errors(cuInit(0), "init");
  // get device
  CUdevice device;
  cuDeviceGet(&device, 0);
  // create context
  CUcontext context;
  check_errors(cuCtxCreate(&context, 0, device), "context create");
  // load module
  CUmodule module;
  check_errors(cuModuleLoad(&module, "matmul_gpu.ptx"), "module load");
  // get kernel function from binary
  CUfunction kernel_addr;
  check_errors(cuModuleGetFunction(&kernel_addr, module, "_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32"), "function load");
  // get dimension to use
  int dim = 1024;
	if (argc >= 2) {
		dim = atoi(argv[1]);
	}
  // compute total size
  size_t size = dim * dim * sizeof(double);
  printf("[dim %d]\n", dim);

  // allocate the host matricies
  double *h_A = reinterpret_cast<double *>(malloc(size));
  double *h_B = reinterpret_cast<double *>(malloc(size));
  double *h_output = reinterpret_cast<double *>(malloc(size));

  // verify that allocations succeeded
  if (h_A == NULL || h_B == NULL || h_output == NULL) {
    fprintf(stderr, "Failed to allocate host vectors!\n");
    exit(EXIT_FAILURE);
  }

  // init the host arrays
  for (int i = 0; i < dim; ++i) {
    for (int j = 0; j < dim; ++j) {
      h_A[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
      h_B[dim*i + j] = rand() / static_cast<double>(RAND_MAX);
    }
  }

  // alloc the device matricies
  CUdeviceptr d_A;
  check_errors(cuMemAlloc(&d_A, size), "device input a alloc");
  CUdeviceptr d_B;
  check_errors(cuMemAlloc(&d_B, size), "device input b alloc");
  CUdeviceptr d_output;
  check_errors(cuMemAlloc(&d_output, size), "device output alloc");

  // copy the host matricies to device
  check_errors(cuMemcpyHtoD(d_A, h_A, size), "device copy a");
  check_errors(cuMemcpyHtoD(d_B, h_B, size), "device copy b");

  // launch the matmul CUDA Kernel
  int threadsPerBlock = 32;
  int blocksPerGrid = dim/threadsPerBlock;
  dim3 cudaBlockSize(threadsPerBlock, threadsPerBlock, 1);
  dim3 cudaGridSize(blocksPerGrid, blocksPerGrid, 1);

  void *arr[] = {&d_output, &d_A, &d_B, &dim};
  check_errors(cuLaunchKernel(kernel_addr, cudaGridSize.x, cudaGridSize.y,
                                 cudaGridSize.z, /* grid dim */
                                 cudaBlockSize.x, cudaBlockSize.y,
                                 cudaBlockSize.z, /* block dim */
                                 0, 0,            /* shared mem, stream */
                                 &arr[0],         /* arguments */
                                 0), "kernel launch");
  check_errors(cuCtxSynchronize(), "sync");

  // copy device result to host
  check_errors(cuMemcpyDtoH(h_output, d_output, size), "host to device copy");

  // free device global memory
  check_errors(cuMemFree(d_A), "free device a");
  check_errors(cuMemFree(d_B), "free device b");
  check_errors(cuMemFree(d_output), "free device output");

  // error check
	// for (int i = 0; i < dim; ++i) {
  //   for (int j = 0; j < dim; ++j) {
  //     if (output[dim*i + j] == 0) {
  //       printf("error with output\n");
  //     }
  //   }
  // }

  // Free host memory
  free(h_A);
  free(h_B);
  free(h_output);

  return 0;
}
