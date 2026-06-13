

#ifndef UI_MANAGER_H
#define UI_MANAGER_H

#include <stdint.h>

typedef enum {
    UI_HOME,
    UI_MACRO,
} ui_state_t;

void ui_init(void);
void ui_change(ui_state_t state);
ui_state_t ui_get_state(void);
ui_state_t ui_get_prev_state(void);
void ui_set_macro_bank(uint8_t index);
#endif
