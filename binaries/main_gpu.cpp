#include <stdio.h>
#include <stdlib.h>
#include <cmath>
#include <cuda.h>
#include <cuda_runtime.h>
#include <nvrtc.h>
#include <builtin_types.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include <sys/time.h>

#define STDIN_BUFFER_SIZE (1024 * 1024 * 10) // support 10MB of input

// timing functions (microseconds)
double get_wall_time(){
    struct timeval time;
    if (gettimeofday(&time,NULL)){
        //  Handle error
        return 0;
    }
    return (double)time.tv_sec * 1e+6 + (double)time.tv_usec;
}

double get_cpu_time(){
    return (double)clock() / CLOCKS_PER_SEC * 1e+6;
}


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
 *load matrix from string of the form [1 2 3; 4 5 6] of size NxM
 *returns the double* to the col-major stored matrix
 */
double* load_matrix(char* matrix_string, int N, int M) {
  char *str1, *str2, *line, *elem;
  char *saveptr1, *saveptr2, *saveptr3;
  double* matrix = reinterpret_cast<double *>(malloc(sizeof(double) * N * M));

  int col = 0;
  int row = 0;

  str1 = matrix_string;
  for (int j = 1; ; j++) {
    line = strtok_r(str1, "[];", &saveptr1);
    str1 = NULL;
    if (line == NULL)
      break;

    str2 = line;
    row = 0;
    while (true) {
      elem = strtok_r(str2, " ", &saveptr2);
      str2 = NULL;
      if (elem == NULL)
        break;

      matrix[row*N + col] = strtof(elem, &saveptr3);
      row ++;
    }
    col ++;
  }

  return matrix;
}


/**
 * encode column-major matrix of size NxM to string of the form [1 2 3; 4 5 6]
 * returns the char* to the matrix string representation
 */
char* encode_matrix(double* matrix, int N, int M) {
	// (number of ; N + [] 2 + num spaces M*N + number of numbers N*M * number size sizeof(double) + null terminator)* sizeof(char)
	char* matrix_string = reinterpret_cast<char *>(malloc((N + 2 + M*N + M*N*sizeof(double) + 1) * sizeof(char)));
	int NUM_SIZE = sizeof(double) + 2;
  int i = 0;
	matrix_string[i] = '[';
	i++;

	for (int row = 0; row < N; row++) {
		for (int col = 0; col < M; col++) {
			char temp_string[NUM_SIZE];
			sprintf(temp_string, "%f ", matrix[N*col + row]);
			for (int j = 0; j < NUM_SIZE - 1; j++) {
				matrix_string[i] = temp_string[j];
				i ++;
			}
		}
		matrix_string[i] = ';';
		i ++;
	}
	matrix_string[i] = ']';
	i ++;
	matrix_string[i] = '\0';

	return matrix_string;
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
  check_errors(cuModuleGetFunction(&kernel_addr, module, "_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_"), "function load");
  // get dimensions to use
  int N = 1024;
	int R = 1024;
	int M = 1024;
  bool random = true;

  if (argc >= 5) {
    N = atoi(argv[1]);
		R = atoi(argv[2]);
		M = atoi(argv[3]);
    if (strcmp(argv[4], "norand") == 0) random = false;
  } else if (argc >= 4) {
		N = atoi(argv[1]);
		R = atoi(argv[2]);
		M = atoi(argv[3]);
	} else if (argc >= 2) {
		N = atoi(argv[1]);
		R = N;
		M = N;
	}
	printf("[dims %dx%d %dx%d -> %dx%d] [random? %i]\n", N, R, R, M, N, M, random);

  // read pid from stdin
  int pid;
  scanf("%i", &pid);

  // host mem
  double *h_A;
  double *h_B;
  double *h_output = reinterpret_cast<double *>(malloc(sizeof(double) * N * M));
  #ifdef ERR_CHECK
  double *h_output_check = reinterpret_cast<double *>(malloc(sizeof(double) * N * M));
  // init output array
  for (int col = 0; col < M; ++col) {
    for (int row = 0; row < N; ++row) {
      h_output_check[N*col + row] = 0;
    }
  }
  #endif

  if (random) {
    // allocate the host input matricies
    h_A = reinterpret_cast<double *>(malloc(sizeof(double) * N * R));
    h_B = reinterpret_cast<double *>(malloc(sizeof(double) * R * M));

    // verify that allocations succeeded
    if (h_A == NULL || h_B == NULL) {
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
  } else {
		// read arrays from stdin
		char* matinput = malloc(sizeof(char) * STDIN_BUFFER_SIZE);
	  char* matstringA;
	  char* matstringB;
		char* rest;
		printf("matrices: ");
		scanf("\n");
		fgets(matinput, STDIN_BUFFER_SIZE, stdin);
		matstringA = strtok_r(matinput, "[]\n", &rest);
		matstringB = strtok_r(NULL, "[]\n", &rest);
		A = load_matrix(matstringA, N, R);
		B = load_matrix(matstringB, R, M);
		free(matinput);

    // verify that allocations succeeded
    if (h_A == NULL || h_B == NULL) {
      fprintf(stderr, "Failed to allocate host vectors!\n");
      exit(EXIT_FAILURE);
    }
  }

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
  int blocksPerRow = (N + threadsPerBlock - N%threadsPerBlock)/threadsPerBlock;
  int blocksPerCol = (M + threadsPerBlock - M%threadsPerBlock)/threadsPerBlock;
  dim3 cudaBlockSize(threadsPerBlock, threadsPerBlock, 1);
  dim3 cudaGridSize(blocksPerRow, blocksPerCol, 1);

  void *arr[] = {&d_output, &d_A, &d_B, &N, &R, &M};
  // call kernel and time function
  double start_cpu = get_cpu_time();
	double start_wall = get_wall_time();
  check_errors(cuLaunchKernel(kernel_addr, cudaGridSize.x, cudaGridSize.y,
                                 cudaGridSize.z, /* grid dim */
                                 cudaBlockSize.x, cudaBlockSize.y,
                                 cudaBlockSize.z, /* block dim */
                                 0, 0,            /* shared mem, stream */
                                 &arr[0],         /* arguments */
                                 0), "kernel launch");
  check_errors(cuCtxSynchronize(), "sync");
  double end_cpu = get_cpu_time();
	double end_wall = get_wall_time();

  // copy device result to host
  check_errors(cuMemcpyDtoH(h_output, d_output, sizeof(double) * N * M), "host to device copy");

  // free device global memory
  check_errors(cuMemFree(d_A), "free device a");
  check_errors(cuMemFree(d_B), "free device b");
  check_errors(cuMemFree(d_output), "free device output");

  #ifdef ERR_CHECK
  basic_matmul(h_output_check, h_A, h_B, N, R, M);
	int count = 0;
  double diff = 0.0;
	for (int i = 0; i < N; ++i) {
    for (int j = 0; j < M; ++j) {
      if (fabs(h_output[N*j + i] - h_output_check[M*i + j]) > 1e-9) {
        count += 1;
        diff += fabs(h_output[N*j + i] - h_output_check[M*i + j]);
      }
    }
  }
	if (count > 0) {
		fprintf(stderr, "%i wrong of %i\n", count, N*M);
		exit(EXIT_FAILURE);
	} else printf("all good!\n");
  #endif

  // load result into matrix string
	char* matstring_out = encode_matrix(output, N, M);

	// save result to out/<pid>.txt
  char filename[4 + pid/10 + 4 + 1];
  sprintf(filename, "out/%d.txt", pid);
	FILE* outfile = fopen(filename, "w+");
	if (outfile == NULL) {
		fprintf(stderr, "error opening file %s\n", filename);
		exit(EXIT_FAILURE);
	}
	char wall_time[317 + 2];
	sprintf(wall_time, "%f\n", end_wall - start_wall);
	if (fputs(wall_time, outfile) < 0) {
		fprintf(stderr, "error writing to file %s\n", filename);
		exit(EXIT_FAILURE);
	}
	char cpu_time[317 + 2];
	sprintf(cpu_time, "%f\n", end_cpu - start_cpu);
	if (fputs(cpu_time, outfile) < 0) {
		fprintf(stderr, "error writing to file %s\n", filename);
		exit(EXIT_FAILURE);
	}
	if (fputs(matstring_out, outfile) < 0) {
		fprintf(stderr, "error writing to file %s\n", filename);
		exit(EXIT_FAILURE);
	}
	if (fclose(outfile) < 0) {
		fprintf(stderr, "error closing file %s\n", filename);
		exit(EXIT_FAILURE);
	}

	// free mem
	free(matstring_out);
	free(A);
	free(B);
	free(output);
	#ifdef ERR_CHECK
	free(output_check);
	#endif

	printf("wall time %f, cpu time %f, pid %i\n", end_wall - start_wall, end_cpu - start_cpu, pid);
	fflush(stdout);

	exit(0);
}
