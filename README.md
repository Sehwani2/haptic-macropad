# STM32 Haptic Macro Pad(Work in Progress)

<img width="400" height="300" alt="img" src="https://github.com/user-attachments/assets/4b0f69e3-72f3-46c9-b3d9-88cf5c8958e4" />



한국어 NOTION : https://www.notion.so/haptic-knob-300518d85eb98059bbadc6083b9559b0?source=copy_link

Custom STM32-based macro pad featuring BLDC haptic feedback, USB HID, SD card filesystem, and LCD GUI.

---

## IMG


---

# Project Overview

This project was inspired by various Haptic Macro Pad projects on YouTube.  
After becoming interested in the concept, I decided to design and build my own custom macro pad by modifying and simplifying the original schematic.

The goal of this project was not only to create a macro pad, but also to develop and validate a complete embedded system based on a custom-designed PCB.

The project focused on bringing up various embedded peripherals step-by-step, from low-level driver development to application layer integration.

In particular, the system was built around a BLDC motor-based haptic feedback mechanism while integrating multiple embedded features such as:

- USB OTG
- SD Card filesystem
- LCD GUI(LVGL)
- BLDC Motor control

The overall objective was to verify hardware functionality, integrate multiple peripherals into a single system, and gain experience in embedded system bring-up and application development.

---

# Features

- USB HID Device
- USB CDC
- USB MSC
- SD Card File System
- LCD GUI (LVGL)
- CLI Debug Interface
- BLDC Motor Control
- Haptic Feedback
- Timer Based Scheduler

---

# Hardware

| Part | Description |
|---|---|
| MCU | STM32 |
| Motor Driver | TMC6300 |
| Encoder | MT6701 |
| Display | SPI LCD |
| Storage | Micro SD Card |
| USB | USB OTG |

---


# Tools

## LVGLImage.py

Python utility for converting image assets (`png`, `jpeg`) into LVGL-compatible data format.(`bin`)

---

# Usage

## USB Storage Structure

When the device is connected in USB MSC mode, the storage is organized as follows:

```text
/
├── img/
│   ├── 0-1.bin
│   └── 0-2.txt
│
└── macro/
    ├── 0-1.txt
    └── 0-2.txt
```

---

# Image Files

Image assets used by the LCD GUI are stored inside the `img` directory.

| File Type | Description |
|---|---|
| `.bin` | LVGL binary image data |
| `.txt` | Text resource |

Example:

```text
img/0-1.bin
```

---

# Macro Files

Macro scripts are stored inside the `macro` directory.

Each macro file contains keyboard actions and string commands that are executed through USB HID.

Example:

```text
CTRL T
STRING https://www.youtube.com
ENTER
```

Another example:

```text
CTRL+C
```

---


# Issues & Troubleshooting

## SD Card Initialization Error

SD Card initialization occasionally failed during startup.

### Solution
Changing the initialization sequence resolved the issue.

```text
1BIT Mode → Card Detect → 4BIT Mode Switch
```

---

## MT6701 Encoder Resolution Issue

The default encoder configuration was insufficient for precise haptic angle control.

### Solution
The encoder was initialized through I2C configuration to modify internal settings.

### Notes
For future revisions:
- SPI interface support
- Configurable encoder setup
- Higher resolution encoder options

should be considered.

---
##BLDC Motor Startup Realignment & Vibration (Resolved)

During the initial startup calibration (D-axis alignment), the motor occasionally experienced high-frequency vibration or failure to align. This happened when the rotor was accidentally positioned at a 180° electrical angle relative to the target vector—creating a physical equilibrium dead-lock—or due to raw register noise from the encoder on power-up.

###Solution

Developed an anti-deadlock startup sequence in firmware:

Encoder Dummy Loop: Flushes initial hardware register spikes for 300ms before triggering the align phase.
Phase-Kick Start: Forcefully injects a 90° phase offset for 50ms to instantly break any physical equilibrium dead-lock regardless of the rotor's initial resting position.
Soft-Start Ramp: Smoothly ramps up the alignment voltage to lock the target 0° electrical angle without physical resonance or overshoot.


Future Improvements
[x] Fix Motor Alignment & Startup Jitter Issue
[ ] NeoPixel LED integration
[ ] Ambient Light Sensor integration
[ ] Additional Haptic Effects (Spring, Barrier, Detent Customization)
[ ] 3D Printed Case
[ ] GUI improvements (LVGL Page animations)
[ ] RTOS porting


# Reference
https://www.youtube.com/watch?v=Q76dMggUH1M&t=1s&pp=ygULaGFwdGljIGJsZGM%3D
https://www.youtube.com/watch?v=bNUKRJQjuvQ&t=1s
