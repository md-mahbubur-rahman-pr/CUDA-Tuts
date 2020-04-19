#define N 99999

__global__  void vector_addition (int *a, int *b, int *c, int n) {
  for (int i=0; i<n; i++) {
    c[i] = a[i] + b[i];
  }
}

int main(){
  int *a, *b, *c;
  int *dev_a, *dev_b, *dev_c;
  
  // allocate memory 
  a = (int*) malloc (sizeof(int) * N);
  b = (int*) malloc (sizeof(int) * N);
  c = (int*) malloc (sizeof(int) * N);
  
  // initialize array 
  for (int i=0; i<N; i++) {
    a[i] = 1;
    b[i] = 2;
  }
  
  // Allocate device memory
  cudaMalloc ( (void**)&dev_a, sizeof(int) * N);
  cudaMalloc ( (void**)&dev_b, sizeof(int) * N);
  cudaMalloc ( (void**)&dev_c, sizeof(int) * N);
  
  // transfer data from host to device memory 
  cudaMemcpy (dev_a, a, sizeof(int) * N, cudaMemcpyHostToDevice);
  cudaMemcpy (dev_b, b, sizeof(int) * N, cudaMemcpyHostToDevice);
  
  // execute kernel 
  vector_addition<<<1,1>>>(dev_a,dev_b,dev_c,N);
  
  // transfer data back to host memory 
  cudaMemcpy (c, dev_c, sizeof(int) * N, cudaMemcpyDeviceToHost);
  
  // display the result
  for (int i=0; i<N; i++) {
    printf("%d + %d = %d\n", ,a[i] + b[i] = c[i]);
  }
  
  // deallocate the device memory 
  cudaFree(dev_a);
  cudaFree(dev_b);
  cudaFree(dev_c);
  
  // deallocate host memory 
  free(a);
  free(b);
  free(c);
  
}
