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

#ifdef ERR_CHECK
void basic_matmul(double* out, double* A, double* B, int N, int R, int M) {
	for (int i = 0; i < N; ++i) {
		for (int j = 0; j < M; ++j) {
			for (int k = 0; k < R; ++k) {
				out[i*M + j] += A[k*N + i] * B[j*R + k];
			}
		}
	}
}
#endif

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
  check_errors(cuModuleGetFunction(&kernel_addr, module, "_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_"), "function load");
  // get dimensions to use
  int N = 1024;
	int R = 1024;
	int M = 1024;
	if (argc >= 4) {
		N = atoi(argv[1]);
		R = atoi(argv[2]);
		M = atoi(argv[3]);
	} else if (argc >- 2) {
		N = atoi(argv[1]);
		R = N;
		M = N;
	}
	printf("[dims %dx%d %dx%d -> %dx%d]\n", N, R, R, M, N, M);

  // allocate the host matricies
  double *h_A = reinterpret_cast<double *>(malloc(sizeof(double) * N * R));
  double *h_B = reinterpret_cast<double *>(malloc(sizeof(double) * R * M));
  double *h_output = reinterpret_cast<double *>(malloc(sizeof(double) * N * M));
  #ifdef ERR_CHECK
  double *h_output_check = reinterpret_cast<double *>(malloc(sizeof(double) * N * M));
  #endif

  // verify that allocations succeeded
  if (h_A == NULL || h_B == NULL || h_output == NULL) {
    fprintf(stderr, "Failed to allocate host vectors!\n");
    exit(EXIT_FAILURE);
  }

  // init the host arrays
  for (int col = 0; col < R; ++col) {
    for (int row = 0; row < N; ++row) {
      h_A[col*N + row] = rand() / static_cast<double>(RAND_MAX);
    }
  }
  for (int col = 0; col < M; ++col) {
    for (int row = 0; row < R; ++row) {
      h_B[R*col + row] = rand() / static_cast<double>(RAND_MAX);
    }
  }
  #ifdef ERR_CHECK
	for (int col = 0; col < M; ++col) {
    for (int row = 0; row < N; ++row) {
			h_output_check[N*col + row] = 0;
    }
  }
  #endif

  // alloc the device matricies
  CUdeviceptr d_A;
  check_errors(cuMemAlloc(&d_A, sizeof(double) * N * R), "device input a alloc");
  CUdeviceptr d_B;
  check_errors(cuMemAlloc(&d_B, sizeof(double) * R * M), "device input b alloc");
  CUdeviceptr d_output;
  check_errors(cuMemAlloc(&d_output, sizeof(double) * N * M), "device output alloc");

  // copy the host matricies to device
  check_errors(cuMemcpyHtoD(d_A, h_A, sizeof(double) * N * R), "device copy a");
  check_errors(cuMemcpyHtoD(d_B, h_B, sizeof(double) * R * M), "device copy b");

  // launch the matmul CUDA Kernel
  int threadsPerBlock = 32;
  int maxdim = std::max(std::max(M, R), N);
  int add = (maxdim % threadsPerBlock == 0)? 0 : threadsPerBlock;
  int blocksPerGrid = (maxdim + add)/threadsPerBlock;
  dim3 cudaBlockSize(threadsPerBlock, threadsPerBlock, 1);
  dim3 cudaGridSize(blocksPerGrid, blocksPerGrid, 1);

  void *arr[] = {&d_output, &d_A, &d_B, &N, &R, &M};
  check_errors(cuLaunchKernel(kernel_addr, cudaGridSize.x, cudaGridSize.y,
                                 cudaGridSize.z, /* grid dim */
                                 cudaBlockSize.x, cudaBlockSize.y,
                                 cudaBlockSize.z, /* block dim */
                                 0, 0,            /* shared mem, stream */
                                 &arr[0],         /* arguments */
                                 0), "kernel launch");
  check_errors(cuCtxSynchronize(), "sync");

  // copy device result to host
  check_errors(cuMemcpyDtoH(h_output, d_output, sizeof(double) * N * M), "host to device copy");

  // free device global memory
  check_errors(cuMemFree(d_A), "free device a");
  check_errors(cuMemFree(d_B), "free device b");
  check_errors(cuMemFree(d_output), "free device output");

  #ifdef ERR_CHECK
  basic_matmul(h_output_check, h_A, h_B, N, R, M);
	int count = 0;
	for (int i = 0; i < N; ++i) {
    for (int j = 0; j < M; ++j) {
      if (fabs(h_output[N*j + i] - h_output_check[M*i + j]) > 1e-9) {
        count += 1;
      }
    }
  }
	if (count > 0) fprintf(stderr, "%i wrong of %i\n", count, N*M);
	else printf("all good!\n");
  #endif

  // Free host memory
  free(h_A);
  free(h_B);
  free(h_output);

  return 0;
}
