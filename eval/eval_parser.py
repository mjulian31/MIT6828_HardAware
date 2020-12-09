import sys

file = sys.argv[1]

gpu_times = dict()
cpu_times = dict()

cpu_time = 0
gpu_time = 0

total_run_cpu = 0
total_run_gpu = 0

with open(file, 'r') as f:
    lines = f.readlines()
    for line in lines:
        arr = line.split()
        if len(arr) == 0:
            continue
        if arr[0] == "--":
            break
        if arr[0] == "task":
            id = arr[2]
            if arr[4] == "cpu:":
                time = int(arr[5])
                cpu_times[id] = time
            elif arr[4] == "gpu:":
                time = int(arr[5])
                gpu_times[id] = time
            else: # time averages
                num = int(arr[7])
                if arr[6] == "cpu:":
                    total_run_cpu += num
                    cpu_time += cpu_times[id]*num
                else:
                    total_run_gpu += num
                    gpu_time += gpu_times[id]*num

print(file)
print("cpu dict", cpu_times)
print("gpu dict", gpu_times)
print("cpu time", cpu_time)
print("gpu time", gpu_time)
print("total", cpu_time + gpu_time, "us")
print("total", (cpu_time + gpu_time) / 1e+6, "sec")
print("cpu num run", total_run_cpu)
print("gpu num run", total_run_gpu)
print("total run", total_run_cpu + total_run_gpu)
