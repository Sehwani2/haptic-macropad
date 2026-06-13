#include "ui_manager.h"
#include "ui_home.h"
#include "ui_macro.h"
#include "lvgl.h"
#include "TMC6300.h"


static ui_state_t current_state;
static uint8_t current_bank = 0;

static ui_state_t prev_state = UI_HOME;

void ui_init()
{
  ui_change(UI_HOME);

}

ui_state_t ui_get_state(void)
{
    return current_state;
}


void ui_set_macro_bank(uint8_t index)
{
    current_bank = index;
}

uint8_t ui_get_macro_bank(void)
{
    return current_bank;
}

void ui_change(ui_state_t state)
{
    prev_state = current_state;

    lv_obj_clean(lv_scr_act());

    current_state = state;

    switch(state)
    {
        case UI_HOME:
            TMC6300_SetHapticMode(false);
            ui_home_create();
            break;

        case UI_MACRO:
            TMC6300_SetHapticMode(true);
            ui_macro_create(current_bank);
            break;

        default:
            TMC6300_SetHapticMode(false);
            break;
    }
}

ui_state_t ui_get_prev_state(void)
{
    return prev_state;
}
