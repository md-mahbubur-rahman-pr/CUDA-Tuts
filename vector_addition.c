#define N 99999

void vector_addition (int *a, int *b, int *c, int n) {
  for (int i=0; i<n; i++) {
    c[i] = a[i] + b[i];
  }
}

int main(){
  int *a, *b, *c;
  
  // allocate memory 
  a = (int*) malloc (sizeof(int) * N);
  b = (int*) malloc (sizeof(int) * N);
  c = (int*) malloc (sizeof(int) * N);
  
  // initialize array 
  for (int i=0; i<N; i++) {
    a[i] = 1;
    b[i] = 2;
  }
  
  vector_addition (a,b,c,N);
}
