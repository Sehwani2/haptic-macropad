#ifndef UI_MACRO_H_
#define UI_MACRO_H_

#include <stdint.h>

// 매크로 화면 생성
void ui_macro_create(uint8_t bank);
uint8_t ui_macro_get_bank(void);
void ui_macro_process(void);

#endif /* UI_MACRO_H_ */
