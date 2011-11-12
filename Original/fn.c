#include <math.h>

#define APPROX 1
#define FOUR_OVER_PI (4.0/3.14159265)

void make_tables(float c[], float t[], unsigned count, float range) {
  unsigned i;
  // cosine approximation coefficients
  const float cc1= 0.9999932946;
  const float cc2=-0.4999124376;
  const float cc3= 0.0414877472;
  const float cc4=-0.0012712095;
  // tangent approximation coefficients
  const float tc1=-3.16783027;
  const float tc2= 0.134516124;
  const float tc3=-4.033321984;

  float x,x2;					// The input argument, and it squared

  i = 0;
  while (i<count) {
    x = i*range/count;
#if APPROX
    x2 = x * x;
    c[i] = (cc1 + x2*(cc2 + x2*(cc3 + cc4*x2))); // compute cos(x)

    x = x*FOUR_OVER_PI;  // compute tan(x)
    x2 = x * x;
    t[i] = (x*(tc1 + tc2 * x2)/(tc3 + x2));      
#else
    c[i] = cosf(x);
    t[i] = tanf(x);
#endif
    i++;
  }

}
