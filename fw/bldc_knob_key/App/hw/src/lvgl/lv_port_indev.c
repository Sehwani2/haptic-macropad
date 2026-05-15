/**
 * @file lv_port_indev_templ.c
 *
 */

/*Copy this file as "lv_port_indev.c" and set this value to "1" to enable content*/
#if 1

/*********************
 *      INCLUDES
 *********************/
#include "lv_port_indev.h"
#include "button.h"
#include "ui/ui_macro.h"
#include "encoder.h"
/*********************
 *      DEFINES
 *********************/

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/

static void keypad_init(void);
static void keypad_read(lv_indev_t * indev, lv_indev_data_t * data);
static uint32_t keypad_get_key(void);
static int8_t encoderGetLVGLDir(void);

/**********************
 *  STATIC VARIABLES
 **********************/
static lv_indev_t * indev_keypad = NULL;



/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void lv_port_indev_init(void)
{
    /**
     * Here you will find example implementation of input devices supported by LittelvGL:
     *  - Touchpad
     *  - Mouse (with cursor support)
     *  - Keypad (supports GUI usage only with key)
     *  - Encoder (supports GUI usage only with: left, right, push)
     *  - Button (external buttons to press points on the screen)
     *
     *  The `..._read()` function are only examples.
     *  You should shape them according to your hardware
     */

    /*------------------
     * Keypad
     * -----------------*/

    /*Initialize your keypad or keyboard if you have*/
    keypad_init();

    /*Register a keypad input device*/
    indev_keypad = lv_indev_create();
    lv_indev_set_type(indev_keypad, LV_INDEV_TYPE_KEYPAD);
    lv_indev_set_read_cb(indev_keypad, keypad_read);

    /*Later you should create group(s) with `lv_group_t * group = lv_group_create()`,
     *add objects to the group with `lv_group_add_obj(group, obj)`
     *and assign this input device to group to navigate in it:
     *`lv_indev_set_group(indev_keypad, group);`*/


}

/**********************
 *   STATIC FUNCTIONS
 **********************/


/*------------------
 * Keypad
 * -----------------*/

/*Initialize your keypad*/
/*------------------
 * Keypad
 * -----------------*/

lv_indev_t * get_keypad_indev(void)
{
    return indev_keypad;
}

static void keypad_init(void)
{
}


static int macro_req = -1;

void macro_req_set(int key)
{
    macro_req = key;
}

int macro_req_get(void)
{
    int ret = macro_req;
    macro_req = -1;   // 읽으면 자동 클리어
    return ret;
}

static void keypad_read(lv_indev_t *indev_drv, lv_indev_data_t *data)
{
    static uint32_t last_key = 0;
    static uint32_t last_act_key = KEY_NONE;

    uint32_t raw_key = keypad_get_key();

    // ----------------------
    // 매크로 키 처리 (Rising Edge)
    // ----------------------
    if(raw_key >= KEY_1 && raw_key <= KEY_6)
    {
        if(raw_key != last_act_key)
        {
          macro_req_set(raw_key);   // ⭐ 요청만 저장
        }

        last_act_key = raw_key;

        data->state = LV_INDEV_STATE_RELEASED;
        data->key = 0;
        return;
    }

    // ----------------------
    // 일반 키 처리
    // ----------------------
    if (raw_key > 0)
    {
        data->state = LV_INDEV_STATE_PRESSED;

        switch (raw_key)
        {
            case KEY_LEFT:  raw_key = LV_KEY_PREV; break;
            case KEY_RIGHT: raw_key = LV_KEY_NEXT; break;
            case KEY_ENTER: raw_key = LV_KEY_ENTER; break;
//            case KEY_BACK:  raw_key = LV_KEY_BACKSPACE; break;
            default:        raw_key = 0; break;
        }

        last_key = raw_key;
    }
    else
    {
        data->state = LV_INDEV_STATE_RELEASED;
        data->key = 0;
    }

    last_act_key = raw_key;
    data->key = last_key;
}

/*Get the currently being pressed key.  0 if no key is pressed*/
static uint32_t keypad_get_key(void)
{
    // 1. 우선순위가 높은 버튼들 (BACK, ENTER)
//    if (buttonGetPressed(0)) return KEY_BACK;
    if (buttonGetPressed(1)) return KEY_ENTER;

    int8_t dir = encoderGetLVGLDir();

    if(dir > 0) return KEY_RIGHT;
    else if(dir < 0) return KEY_LEFT;

    // 3. 매크로 버튼들 (KEY_1 ~ KEY_6)
    if (buttonGetPressed(2)) return KEY_1;
    if (buttonGetPressed(3)) return KEY_2;
    if (buttonGetPressed(4)) return KEY_3;
    if (buttonGetPressed(5)) return KEY_4;
    if (buttonGetPressed(6)) return KEY_5;
    if (buttonGetPressed(7)) return KEY_6;

    return KEY_NONE;
}

// LVGL용 엔코더
#define LVGL_ENCODER_STEP 200

static int32_t enc_lvgl_pos = 0;

static int8_t encoderGetLVGLDir(void)
{
  int32_t enc_pos_now = encoderGetCount();
  int32_t diff = enc_pos_now - enc_lvgl_pos;

    if(diff >= LVGL_ENCODER_STEP)
    {
        enc_lvgl_pos += LVGL_ENCODER_STEP;
        return +1;
    }
    else if(diff <= -LVGL_ENCODER_STEP)
    {
        enc_lvgl_pos -= LVGL_ENCODER_STEP;
        return -1;
    }

    return 0;
}
#else /*Enable this file at the top*/

/*This dummy typedef exists purely to silence -Wpedantic.*/
typedef int keep_pedantic_happy;
#endif
