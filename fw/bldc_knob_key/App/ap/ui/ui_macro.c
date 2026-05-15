#include "ui_macro.h"
#include "ui_manager.h"
#include "macro/macro.h"
#include "lvgl.h"
#include "lv_port_indev.h"

// ----------------------
// 버튼 배열 (⭐ 핵심)
// ----------------------
static lv_obj_t *macro_btns[6];

// ----------------------
// 현재 선택된 매크로 페이지
// ----------------------
static uint8_t current_bank = 0;


// ----------------------
// 파일 존재 확인
// ----------------------
static bool file_exists(const char *path)
{
    lv_fs_file_t f;
    if(lv_fs_open(&f, path, LV_FS_MODE_RD) == LV_FS_RES_OK)
    {
        lv_fs_close(&f);
        return true;
    }
    return false;
}

// ----------------------
// 버튼 이벤트 콜백
// ----------------------
static void macro_btn_event(lv_event_t *e)
{
    if(lv_event_get_code(e) != LV_EVENT_CLICKED) return;

    uint32_t index = (uint32_t)(uintptr_t)lv_event_get_user_data(e);

    // 클릭된 버튼에 따라 요청 설정
    macro_req_set(4 + index);
}


// ----------------------
// UI 생성
// ----------------------
void ui_macro_create(uint8_t bank)
{
    current_bank = bank;   // ⭐ 현재 bank 저장

    lv_obj_t *screen = lv_screen_active();
    lv_obj_clear_flag(screen, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_scrollbar_mode(screen, LV_SCROLLBAR_MODE_OFF);

    lv_obj_t *cont = lv_obj_create(screen);
    lv_obj_set_size(cont, 168, 120);
    lv_obj_center(cont);

    lv_obj_set_style_bg_opa(cont, 0, 0);
    lv_obj_set_style_border_width(cont, 0, 0);
    lv_obj_set_style_pad_all(cont, 0, 0);
    lv_obj_set_style_pad_left(cont, 5, 0);

    static lv_coord_t col_dsc[] = {50, 50, 50, LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc[] = {60, 60, LV_GRID_TEMPLATE_LAST};

    lv_obj_set_layout(cont, LV_LAYOUT_GRID);
    lv_obj_set_grid_dsc_array(cont, col_dsc, row_dsc);
    lv_obj_set_style_pad_gap(cont, 3, 0);

    for(int i = 0; i < 6; i++)
    {
        lv_obj_t *btn = lv_obj_create(cont);
        macro_btns[i] = btn;

        lv_obj_set_size(btn, 40, 40);
        lv_obj_set_grid_cell(btn,
            LV_GRID_ALIGN_CENTER, i % 3, 1,
            LV_GRID_ALIGN_CENTER, i / 3, 1
        );

        lv_obj_clear_flag(btn, LV_OBJ_FLAG_SCROLLABLE);
        lv_obj_set_scrollbar_mode(btn, LV_SCROLLBAR_MODE_OFF);
        lv_obj_set_style_pad_all(btn, 0, 0);

        lv_obj_set_style_radius(btn, 10, 0);
        lv_obj_set_style_bg_color(btn, lv_color_hex(0x2f3243), 0);
        lv_obj_set_style_bg_opa(btn, LV_OPA_COVER, 0);

        lv_obj_set_style_border_width(btn, 2, 0);
        lv_obj_set_style_border_color(btn, lv_color_hex(0x44485a), 0);

        lv_obj_set_style_bg_color(btn, lv_color_hex(0x4e526d), LV_STATE_PRESSED);
        lv_obj_set_style_translate_y(btn, 2, LV_STATE_PRESSED);

        lv_obj_add_event_cb(btn, macro_btn_event, LV_EVENT_CLICKED, (void*)(uintptr_t)i);

        // ----------------------
        // 이미지/텍스트 표시
        // ----------------------
        char path_img[64];
        char path_txt[64];

        sprintf(path_img, "S:/img/%d-%d.bin", bank, i+1);
        sprintf(path_txt, "S:/img/%d-%d.txt", bank, i+1);

        if(file_exists(path_img))
        {
            lv_obj_t *img = lv_image_create(btn);
            lv_image_set_src(img, path_img);
            lv_obj_center(img);
            lv_obj_add_flag(img, LV_OBJ_FLAG_EVENT_BUBBLE);
        }
        else
        {
            lv_obj_t *label = lv_label_create(btn);

            if(file_exists(path_txt))
            {
                lv_fs_file_t f;
                if(lv_fs_open(&f, path_txt, LV_FS_MODE_RD) == LV_FS_RES_OK)
                {
                    char buf[32] = {0};
                    uint32_t br;
                    lv_fs_read(&f, buf, sizeof(buf)-1, &br);
                    lv_fs_close(&f);

                    for(uint32_t k = 0; k < br; k++)
                    {
                        if(buf[k] == '\r' || buf[k] == '\n')
                        {
                            buf[k] = '\0';
                            break;
                        }
                    }

                    lv_label_set_text(label, buf);
                }
            }
            else
            {
                lv_label_set_text(label, "");
            }

            lv_obj_set_style_text_color(label, lv_color_white(), 0);
            lv_obj_set_style_text_font(label, &lv_font_montserrat_12, 0);
            lv_obj_set_style_text_align(label, LV_TEXT_ALIGN_CENTER, 0);

            lv_label_set_long_mode(label, LV_LABEL_LONG_WRAP);
            lv_obj_set_width(label, 38);

            lv_obj_center(label);
        }
    }
}

uint8_t ui_macro_get_bank(void)
{
    return current_bank;
}

// ----------------------
// 매크로 요청 처리 (main loop에서 호출)
// ----------------------
// ----------------------
// 매크로 요청 처리 (main loop에서 호출)
// ----------------------
void ui_macro_process(void)
{
    if(ui_get_state() != UI_MACRO)
        return;

    int key = macro_req_get();

    if(key >= KEY_1 && key <= KEY_6)
    {
        int index = key - KEY_1;

        macro_req_set(KEY_NONE);

        macro_request(current_bank, index);
    }
}
