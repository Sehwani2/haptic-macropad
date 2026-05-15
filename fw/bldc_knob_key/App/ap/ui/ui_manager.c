#include "ui_manager.h"
#include "ui_home.h"
#include "ui_macro.h"
#include "lvgl.h"



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
            ui_home_create();
            break;

        case UI_MACRO:
            ui_macro_create(current_bank);
            break;
    }
}

ui_state_t ui_get_prev_state(void)
{
    return prev_state;
}
