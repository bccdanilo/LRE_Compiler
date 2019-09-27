
#include "TimerOne.h"

#ifdef __cplusplus
extern "C" {
#endif

void timerone_attachInterrupt(void (*isr)(), long microseconds) {
	Timer1.attachInterrupt(isr, microseconds);
}

#ifdef __cplusplus
}
#endif

