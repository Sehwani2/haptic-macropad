#include "fat_fs.h"

#ifdef _USE_HW_FATFS
#include "fatfs.h"
#include "cli.h"

#ifdef _USE_HW_CLI
static void cliCmd(cli_args_t *args);
#endif

static bool is_init = false;


bool fatfsInit(void)
{

   if (f_mount(&SDFatFS, SDPath, 0) == FR_OK)
  {
    is_init = true;
  }

  cliAdd("fatfs", cliCmd);

  return is_init;
}


static FRESULT list_dir(const char *path)
{
  FRESULT res;
  DIR dir;
  FILINFO fno;

  res = f_opendir(&dir, path);
  if (res == FR_OK)
  {
    while (1)
    {
      res = f_readdir(&dir, &fno);
      if (res != FR_OK || fno.fname[0] == 0)
        break;

      if (fno.fattrib & AM_DIR)
      {
        cliPrintf("<DIR> %s\n", fno.fname);
      }
      else
      {
        cliPrintf("%lu %s\n", fno.fsize, fno.fname);
      }
    }
    f_closedir(&dir);
  }
  else
  {
    cliPrintf("Failed to open %s (%d)\n", path, res);
  }

  return res;
}


static void cliCmd(cli_args_t *args)
{
  bool ret = false;

  if (args->argc == 1 && args->isStr(0, "info"))
  {
    cliPrintf("fatfs init : %s\n", is_init ? "OK" : "FAIL");
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "dir"))
  {
    list_dir("0:/");
    ret = true;
  }

  if (args->argc == 1 && args->isStr(0, "write"))
  {
    FIL fil;
    UINT bw;

    if (f_open(&fil, "0:/hello.txt", FA_CREATE_ALWAYS | FA_WRITE) == FR_OK)
    {
      char *msg = "Hello World\r\n";

      if (f_write(&fil, msg, strlen(msg), &bw) == FR_OK)
      {
        cliPrintf("write ok %d bytes\n", bw);
      }
      else
      {
        cliPrintf("write fail\n");
      }

      f_close(&fil);
    }
    else
    {
      cliPrintf("file open fail\n");
    }

    ret = true;
  }

  if (!ret)
  {
    cliPrintf("fatfs info\n");
    cliPrintf("fatfs dir\n");
    cliPrintf("fatfs write\n");
  }
}

#endif
