/// @file transform.cpp
#include <emscripten.h> // macro EMSCRIPTEN_KEEPALIVE
#include <stdint.h>
#include <numeric>
extern "C" {
/// @return 0 on success, otherwise error code
int32_t EMSCRIPTEN_KEEPALIVE transform(const int32_t arlen, uint8_t *ar)  {
   const char IVAL = 'i';
   const char OVAL = 'y';
   for (int i=0; i<arlen; ++i) { if (ar[i]==IVAL) { ar[i]=OVAL; } }
   return arlen;
}
} // extern "C"
