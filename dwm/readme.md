# DWM configuration 

Please refer to https://dwm.suckless.org/ for original DWM information / instructions.

## List of Patches

- fullgaps : https://dwm.suckless.org/patches/fullgaps/
- autostart : https://dwm.suckless.org/patches/autostart/
- systray : https://dwm.suckless.org/patches/systray/
- fullscreen : https://dwm.suckless.org/patches/fullscreen/
- clock : manually added a clock in status postion

Systray and fullgaps were merged.

### Clock

Was added inside updatestatus() and run() functions.

- Generated and Display the clock in updatestatus
- Update the clock in run()

