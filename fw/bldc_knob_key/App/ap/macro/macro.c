#include "macro.h"
#include "button.h"
#include "usb.h"
#include "ui/ui_manager.h"
#include "TMC6300.h"
// ----------------------
// 상태 정의
// ----------------------
typedef enum {
  MACRO_IDLE,
  MACRO_LOAD_LINE,
  MACRO_EXEC_LINE,
  MACRO_KEY_RELEASE,
  MACRO_STRING,
  MACRO_DELAY,
} macro_state_t;

// ----------------------
// 전역 상태
// ----------------------
static macro_state_t state = MACRO_IDLE;

static char macro_buf[256];
static char *line_ptr = NULL;
static char *str_ptr = NULL;

static uint8_t cur_mod = 0;
static uint8_t cur_key = 0;

static uint32_t delay_cnt = 0;
// ----------------------
// 내부 함수
// ----------------------
static void send_key_press(uint8_t mod, uint8_t key);
static void send_key_release(void);
static void macro_parse_line(char *line);
static uint8_t ascii_to_hid(char c);
static uint8_t ascii_to_hid_with_shift(char c, uint8_t *mod);
static void macro_haptic_callback(int32_t diff);

void macro_init(void)
{
  haptic_set_callback(macro_haptic_callback);
}

// ----------------------
// 실행중 체크
// ----------------------
bool macro_is_running(void)
{
  return (state != MACRO_IDLE);
}

// ----------------------
// 매크로 시작
// ----------------------
void macro_run(uint8_t bank, uint8_t index)
{
  char path[64];
  sprintf(path, "S:/macro/%d-%d.txt", bank, index + 1);

  lv_fs_file_t f;
  if(lv_fs_open(&f, path, LV_FS_MODE_RD) != LV_FS_RES_OK)
  {
    printf("file open fail\n");
    return;
  }

  uint32_t br;
  memset(macro_buf, 0, sizeof(macro_buf));
  lv_fs_read(&f, macro_buf, sizeof(macro_buf)-1, &br);
  lv_fs_close(&f);

  line_ptr = strtok(macro_buf, "\n");
  state = MACRO_LOAD_LINE;
}

// ----------------------
// 요청 (중복 방지)
// ----------------------
void macro_request(uint8_t bank, uint8_t index)
{
  if(macro_is_running()) return;
  macro_run(bank, index);
}

// ----------------------
// 매크로 업데이트
// ----------------------
void macro_update(void)
{
  switch(state)
  {
  case MACRO_IDLE:
    break;

    // ----------------------
    // 라인 로드
    // ----------------------
  case MACRO_LOAD_LINE:
  {
    if(line_ptr == NULL)
    {
      state = MACRO_IDLE;
      break;
    }

    // 개행 제거
    char *p = strchr(line_ptr, '\r');
    if(p) *p = 0;

    macro_parse_line(line_ptr);
    break;
  }

  // ----------------------
  // 키 실행 (단일 키)
  // ----------------------
  case MACRO_EXEC_LINE:
  {
    if(cur_key != 0)
    {
      send_key_press(cur_mod, cur_key);
      state = MACRO_KEY_RELEASE;
    }
    else
    {
      line_ptr = strtok(NULL, "\n");
      state = MACRO_LOAD_LINE;
    }
    break;
  }

  // ----------------------
  // 키 release
  // ----------------------
  case MACRO_KEY_RELEASE:
  {
    send_key_release();

    // 초기화
    cur_key = 0;
    cur_mod = 0;

    // ⭐ 핵심: STRING이면 계속 진행
    if(str_ptr != NULL)
    {
      state = MACRO_STRING;
    }
    else
    {
      line_ptr = strtok(NULL, "\n");
      state = MACRO_LOAD_LINE;
    }
    break;
  }

  // ----------------------
  // 문자열 입력
  // ----------------------
  case MACRO_STRING:
  {
    if(*str_ptr)
    {
      uint8_t mod = 0;
      uint8_t key = ascii_to_hid_with_shift(*str_ptr, &mod);

      str_ptr++;

      if(key != 0)
      {
        cur_mod = mod;
        cur_key = key;
        state = MACRO_EXEC_LINE;
      }
    }
    else
    {
      // 문자열 끝
      str_ptr = NULL;
      line_ptr = strtok(NULL, "\n");
      state = MACRO_LOAD_LINE;
    }
    break;
  }

  // ----------------------
  // 딜레이
  // ----------------------
  case MACRO_DELAY:
  {
    if(delay_cnt > 0)
    {
      delay_cnt--;
    }
    else
    {
      line_ptr = strtok(NULL, "\n");
      state = MACRO_LOAD_LINE;
    }
    break;
  }
  }
}

// ----------------------
// 라인 파싱
// ----------------------
static void macro_parse_line(char *line)
{
  cur_mod = 0;
  cur_key = 0;
  str_ptr = NULL;

  // STRING
  if(strncmp(line, "STRING ", 7) == 0)
  {
    str_ptr = line + 7;
    state = MACRO_STRING;
    return;
  }

  // ENTER
  if(strcmp(line, "ENTER") == 0)
  {
    cur_key = 0x28;
    state = MACRO_EXEC_LINE;
    return;
  }

  // DELAY
  if(strncmp(line, "DELAY ", 6) == 0)
  {
    int ms = atoi(line + 6);
    delay_cnt = ms / 20;
    if(delay_cnt == 0) delay_cnt = 1;

    state = MACRO_DELAY;
    return;
  }

  // modifier
  if(strstr(line, "CTRL"))  cur_mod |= 0x01;
  if(strstr(line, "SHIFT")) cur_mod |= 0x02;
  if(strstr(line, "ALT"))   cur_mod |= 0x04;
  if(strstr(line, "GUI"))   cur_mod |= 0x08;

  // 마지막 문자
  char key_char = line[strlen(line)-1];
  cur_key = ascii_to_hid(key_char);

  state = MACRO_EXEC_LINE;
}

// ----------------------
// HID 전송
// ----------------------
static void send_key_press(uint8_t mod, uint8_t key)
{
  uint8_t report[9] = {1, mod, 0, key, 0,0,0,0,0};
  usbHidSendReport(report, 9);
}

static void send_key_release(void)
{
  uint8_t release[9] = {1,0,0,0,0,0,0,0,0};
  usbHidSendReport(release, 9);
}

// ----------------------
// ASCII 변환
// ----------------------
static uint8_t ascii_to_hid(char c)
{
  if(c == '\0' || c == '\r' || c == '\n') return 0;
  if(c >= 'a' && c <= 'z') return c - 'a' + 0x04;
  if(c >= 'A' && c <= 'Z') return c - 'A' + 0x04;
  if(c >= '1' && c <= '9') return c - '1' + 0x1E;
  if(c == '0') return 0x27;

  return 0;
}

static uint8_t ascii_to_hid_with_shift(char c, uint8_t *mod)
{
  *mod = 0;

  if(c == '\0' || c == '\r' || c == '\n') return 0;

  if(c >= 'a' && c <= 'z')
    return c - 'a' + 0x04;

  if(c >= 'A' && c <= 'Z')
  {
    *mod = 0x02;
    return c - 'A' + 0x04;
  }

  if(c >= '1' && c <= '9')
    return c - '1' + 0x1E;

  if(c == '0') return 0x27;
  if(c == ' ') return 0x2C;
  if(c == '.') return 0x37;
  if(c == '/') return 0x38;

  // ⭐ 핵심 추가
  if(c == ':')
  {
    *mod = 0x02;
    return 0x33; // shift + ;
  }

  return 0;
}

//////////////////////////// test///////////////////
typedef struct {
  uint8_t modifier;
  uint8_t key_code;
  bool    last_state;
} macro_key_t;

// 6개의 매크로 버튼 설정 (Ctrl+S, Ctrl+C 등)
static macro_key_t macro_tbl[6] = {
    {0x01, 0x16, false}, // KEY1: Ctrl + S
    {0x01, 0x06, false}, // KEY2: Ctrl + C
    {0x01, 0x19, false}, // KEY3: Ctrl + V
    {0x00, 0x28, false}, // KEY4: Enter (예시)
    {0x00, 0x3B, false}, // KEY5: F1 (예시)
    {0x08, 0x15, false}, // KEY6: Win + R
};

void testMacroUpdate(void) {
  // 1. 매크로 버튼 처리
  for (int i=0; i<6; i++) {
    bool current_state = buttonGetPressed(i + 2); // KEY1은 인덱스 2부터 시작

    if (current_state == true && macro_tbl[i].last_state == false) {
      // 버튼을 새로 눌렀을 때 USB 전송 (Keyboard Report ID: 1)
      uint8_t report[9] = {1, macro_tbl[i].modifier, 0, macro_tbl[i].key_code, 0, 0, 0, 0, 0};
      usbHidSendReport(report, 9);
      printf("hid event\r\n");

      macro_tbl[i].last_state = true;
    }
    else if (current_state == false && macro_tbl[i].last_state == true) {
      // 버튼을 뗐을 때 (Key Release)
      uint8_t report[9] = {1, 0, 0, 0, 0, 0, 0, 0, 0};
      usbHidSendReport(report, 9);

      macro_tbl[i].last_state = false;
    }
  }

}

static void macro_haptic_callback(int32_t diff)
{
  if(ui_get_state() == UI_MACRO)
  {
    uint8_t mouse_report[5] = {0};  //

    mouse_report[0] = 0x02;         // Report ID
    mouse_report[1] = 0x00;         // 버튼 없음
    mouse_report[2] = 0x00;         // X
    mouse_report[3] = 0x00;         // Y
    mouse_report[4] = (int8_t)diff; // Wheel

    usbHidSendReport(mouse_report, 5);  //
  }
}


