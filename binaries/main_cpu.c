#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include <sys/time.h>
#include <unistd.h>

#define STDIN_BUFFER_SIZE (1024 * 1024 * 30) // support 30MB of input

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


void matmul(float* out, float* A, float* B, int N, int R, int M);


#ifdef ERR_CHECK
void basic_matmul(float* out, float* A, float* B, int N, int R, int M) {
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
 * load matrix from string of the form [1 2 3; 4 5 6] of size NxM
 * returns the float* to the col-major stored matrix
 */
float* load_matrix(char* matrix_string, int N, int M) {
  char *str1, *str2, *line, *elem;
  char *saveptr1, *saveptr2, *saveptr3;
  float* matrix = (float*)(malloc(sizeof(float) * N * M));

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
char* encode_matrix(float* matrix, int N, int M) {
	// (number of ; N + [] 2 + num spaces M*N + number of numbers N*M * number size sizeof(float) + null terminator)* sizeof(char)
	char* matrix_string = (char*)(malloc((N + 2 + M*N + M*N*sizeof(float)*8 + 1) * sizeof(char)));
	int NUM_SIZE = sizeof(float)*8 + 2;
  int i = 0;
	matrix_string[i] = '[';
	i++;

	for (int row = 0; row < N; row++) {
		for (int col = 0; col < M; col++) {
			char temp_string[NUM_SIZE];
			sprintf(temp_string, "%f ", matrix[N*col + row]);
			for (int j = 0; j < NUM_SIZE - 1; j++) {
        if (temp_string[j] == '\0') break;
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


int main(int argc, char *argv[]) {
	// load matrix vals
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
	printf("pid: ");
	scanf("%i", &pid);

	// alloc mem
	float* A;
	float* B;
	float* output = malloc(sizeof(float) * N * M);
	#ifdef ERR_CHECK
	float* output_check = malloc(sizeof(float) * N * M);
	#endif

	// init arrays
	if (random) {
		A = malloc(sizeof(float) * N * R);
		B = malloc(sizeof(float) * R * M);

	  for (int col = 0; col < R; ++col) {
			for (int row = 0; row < N; ++row) {
				A[N*col + row] = rand() / (float)(RAND_MAX);
	    }
	  }
		for (int col = 0; col < M; ++col) {
	    for (int row = 0; row < R; ++row) {
	      B[R*col + row] = rand() / (float)(RAND_MAX);
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
        //printf("BINDEBUG: matinput is '%s'", matinput);
		matstringA = strtok_r(matinput, "[]\n", &rest);
		matstringB = strtok_r(NULL, "[]\n", &rest);
		A = load_matrix(matstringA, N, R);
		B = load_matrix(matstringB, R, M);
		free(matinput);
	}

	for (int col = 0; col < M; ++col) {
    for (int row = 0; row < N; ++row) {
			output[N*col + row] = 0;
			#ifdef ERR_CHECK
			output_check[N*col + row] = 0;
			#endif
    }
  }

	// call kernel and time call
	double start_cpu = get_cpu_time();
	double start_wall = get_wall_time();
	matmul(output, A, B, N, R, M);
	double end_wall = get_wall_time();
	double end_cpu = get_cpu_time();

	// error check
	#ifdef ERR_CHECK
	basic_matmul(output_check, A, B, N, R, M);
	int count = 0;
	for (int i = 0; i < N; ++i) {
    for (int j = 0; j < M; ++j) {
      if (fabs(output[N*j + i] - output_check[M*i + j]) > 1e-9) {
        count += 1;
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
    if (fflush(outfile) != 0) { // flush all data fully to os
        fprintf(stderr, "error writing to file %s\n", filename);
        exit(EXIT_FAILURE);
    }
    if (false) { // flushing disabled for perf!
        if (fsync(fileno(outfile)) != 0) { // flush all data fully to disk
            fprintf(stderr, "error writing to file %s\n", filename);
            exit(EXIT_FAILURE);
        }
        if (fclose(outfile) < 0) {
            fprintf(stderr, "error closing file %s\n", filename);
            exit(EXIT_FAILURE);
        }
    }

	// free mem
	free(matstring_out);
	free(A);
	free(B);
	free(output);
	#ifdef ERR_CHECK
	free(output_check);
	#endif

	printf("wall time %f us, cpu time %f us, pid %i\n", end_wall - start_wall, end_cpu - start_cpu, pid);
	fflush(stdout);

	exit(0);
}
