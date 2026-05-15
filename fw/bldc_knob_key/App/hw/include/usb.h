

#ifndef HW_USB_H_
#define HW_USB_H_

#include "hw_def.h"

#ifdef _USE_HW_USB

typedef enum
{
  USB_NON_MODE,
  USB_CDC_MODE,
  USB_MSC_MODE,
  USB_HID_MODE
} UsbMode;

bool usbInit(void);
bool usbBegin(UsbMode usb_mode);
void usbDeInit(void);

UsbMode usbGetMode(void);

// hid
bool usbHidSendReport(uint8_t *report, uint16_t len);
#endif

#endif /* HW_USB_H_ */
