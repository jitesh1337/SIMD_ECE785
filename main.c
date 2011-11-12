#include <stdio.h>
#include <sys/time.h> 
#include <math.h>

#define NUM_ELEMENTS 100000
#define RANGE (3.14159265/4.0)
extern void make_tables(float s[], float t[], unsigned count, float range);

#define EXPECTED_COS_TOTAL 90031.867188
#define EXPECTED_TAN_TOTAL 44126.617188


float arr_cos[NUM_ELEMENTS];
float arr_tan[NUM_ELEMENTS];


/* Subtract the `struct timeval' values X and Y,
   storing the result in RESULT.
   Return 1 if the difference is negative, otherwise 0.  */
	
int timeval_subtract (result, x, y)
     struct timeval *result, *x, *y;
{
  /* Perform the carry for the later subtraction by updating y. */
  if (x->tv_usec < y->tv_usec) {
    int nsec = (y->tv_usec - x->tv_usec) / 1000000 + 1;
    y->tv_usec -= 1000000 * nsec;
    y->tv_sec += nsec;
  }
  if (x->tv_usec - y->tv_usec > 1000000) {
    int nsec = (y->tv_usec - x->tv_usec) / 1000000;
    y->tv_usec += 1000000 * nsec;
    y->tv_sec -= nsec;
  }
	
  /* Compute the time remaining to wait.
     tv_usec  is certainly positive. */
  result->tv_sec = x->tv_sec - y->tv_sec;
  result->tv_usec = x->tv_usec - y->tv_usec;
	
  /* Return 1 if result is negative. */
  return x->tv_sec < y->tv_sec;
}

	
void init(float x[], unsigned count) {
  unsigned i;

  for (i=0; i < count; i++) {
    x[i] = i;
  }
}

	
float sum (float x[], unsigned count) {
  unsigned i;
  float sum = 0.0;

  for (i=0; i < count; i++) {
    sum += x[i];
  }
  return sum;
}

int main()
{
  struct timeval tv1, tv2, tve;
  float total;

  printf("Project 3 Starter\n");
  gettimeofday(&tv1,0);

  make_tables(arr_cos, arr_tan, NUM_ELEMENTS, RANGE);
  
  gettimeofday(&tv2,0);
 
  timeval_subtract(&tve, &tv2, &tv1);
  printf("Program took %ld sec, %ld usec\n", (long int) tve.tv_sec, (long int) tve.tv_usec);
  
  total = sum (arr_cos, NUM_ELEMENTS);
  printf("Total cos is %f\n", total);
  if (fabsf(total-EXPECTED_COS_TOTAL) > 0.001) {
    printf("Error: %f%%\n", 100*(total-EXPECTED_COS_TOTAL)/EXPECTED_COS_TOTAL);
  } else {
    printf("Correct\n");
  }

  total = sum (arr_tan, NUM_ELEMENTS);
  printf("Total tan is %f\n", total);
  if (fabsf(total-EXPECTED_TAN_TOTAL) > 0.001) {
    printf("Error: %f%%\n", 100*(total-EXPECTED_TAN_TOTAL)/EXPECTED_TAN_TOTAL);
  } else {
    printf("Correct\n");
  }


  return 0;
}


