#include "ap.h"
#include "ui/ui_manager.h"





void apInit(void)
{
  macro_init();
  cliOpen(_DEF_UART1, 115200);
  cliLogo();
  gpioPinWrite(0, 1);	//lcd led on
  ui_init();
}


void apMain(void)
{
  while(1)
  {
    encoderUpdate();
    TMC6300_UpdateHaptic();


    if(timerGetFlag_1ms())
    {

    }
    if(timerGetFlag_5ms())
    {

    }
    if(timerGetFlag_10ms())
    {
      ui_macro_process();
      macro_update();

      encoderUpdateVelocity(0.01f);
    }
    if(timerGetFlag_20ms())
    {
      lvglUpdate();
    }
    if(timerGetFlag_50ms())
    {
      cliMain();

    }
    if(timerGetFlag_100ms())
    {
      if(buttonGetPressed(0)) // Back 버튼이 눌리면
      {
        ui_state_t prev_state = ui_get_prev_state();
          ui_change(prev_state); // 이전 화면으로 돌아가기
          while(buttonGetPressed(0)); // 버튼 릴리즈까지 대기
      }
    }

    if(timerGetFlag_500ms())
    {
      ledToggle(_DEF_LED1);
    }

  }
}


/*
void lv_fs_full_test(void)
{
  lv_fs_file_t f;
  lv_fs_res_t res;
  uint32_t bw, br, pos;
  char buf[64];

  printf("\n--- LVGL FS Full Test Start ---\n");

  // 1. 파일 쓰기 (Write)
  res = lv_fs_open(&f, "S:/test_full.txt", LV_FS_MODE_WR);
  if(res != LV_FS_RES_OK) {
    printf("1. Open for write failed: %d\n", res);
    return;
  }
  const char * msg = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  lv_fs_write(&f, msg, strlen(msg), &bw);
  lv_fs_close(&f);
  printf("1. Write success (%d bytes)\n", (int)bw);

  // 2. Seek & Tell 테스트
  res = lv_fs_open(&f, "S:/test_full.txt", LV_FS_MODE_RD);
  if(res == LV_FS_RES_OK) {
    // 10바이트 지점으로 이동 (Seek)
    lv_fs_seek(&f, 10, LV_FS_SEEK_SET);

    // 현재 위치 확인 (Tell)
    lv_fs_tell(&f, &pos);
    printf("2. Seek to 10, Current Pos: %d\n", (int)pos);

    // 해당 위치부터 5바이트 읽기 (Read)
    memset(buf, 0, sizeof(buf));
    lv_fs_read(&f, buf, 5, &br);
    printf("2. Read from pos 10: %s (Expected: ABCDE)\n", buf);

    lv_fs_close(&f);
  }

  // 3. 디렉토리 읽기 테스트 (Directory Open/Read/Close)
  printf("3. Reading Root Directory:\n");
  lv_fs_dir_t dir;
  res = lv_fs_dir_open(&dir, "S:/");
  if(res == LV_FS_RES_OK) {
    char fn[256];
    while(1) {
      res = lv_fs_dir_read(&dir, fn, sizeof(fn));
      if(res != LV_FS_RES_OK || fn[0] == '\0') break;

      if(fn[0] == '/') printf("  [DIR]  %s\n", fn);
      else             printf("  [FILE] %s\n", fn);
    }
    lv_fs_dir_close(&dir);
    printf("3. Directory read done.\n");
  } else {
    printf("3. Directory open failed: %d\n", res);
  }

  printf("--- LVGL FS Full Test End ---\n\n");
}
*/
