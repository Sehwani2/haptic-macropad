#include "ui_home.h"
#include "ui_manager.h"
#include "lvgl.h"
#include "lv_port_indev.h"

static void home_btn_event(lv_event_t *e)
{
    uint32_t index = (uint32_t)lv_event_get_user_data(e);

    ui_set_macro_bank(index);
    ui_change(UI_MACRO);
}

void ui_home_create(void)
{
    lv_obj_t *cont = lv_obj_create(lv_scr_act());
    lv_obj_set_size(cont, 160, 128);
    lv_obj_center(cont);
    lv_obj_set_flex_flow(cont, LV_FLEX_FLOW_COLUMN);

    lv_obj_set_style_pad_left(cont, 20, 0);

    lv_group_t * g = lv_group_create();

    for(int i = 0; i < 6; i++)
    {
        char buf[32];
        sprintf(buf, "Macro Set %d", i);

        lv_obj_t *btn = lv_btn_create(cont);
        lv_obj_set_size(btn, lv_pct(90), 30);                 // 너비 90%, 높이 30
        lv_obj_set_style_pad_all(btn, 4, 0);

        lv_obj_t *label = lv_label_create(btn);
        lv_label_set_text(label, buf);
        lv_obj_center(label);

        lv_group_add_obj(g, btn);
        lv_obj_add_event_cb(btn, home_btn_event, LV_EVENT_CLICKED, (void*)i);
    }

    lv_indev_set_group(get_keypad_indev(), g);
}
