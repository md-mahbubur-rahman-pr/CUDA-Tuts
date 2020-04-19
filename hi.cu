
// The __global__ specifier indicates a function that runs on GPU (the device).
__global__ void cuda_say_hi() {
  printf("Hi, CUDA!\n");
}

int main() {
  // While a kernel being called, its execution configuration is provided through <<< .,. >>> syntax. 
  // In CUDA, it's called "kernel_launch".
  cuda_say_hi<<<1,1>>>();
  return 0;
}
