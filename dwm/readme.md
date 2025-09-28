# DWM configuration 

Please refer to https://dwm.suckless.org/ for original DWM information / instructions.

## List of Patches

- fullgaps : https://dwm.suckless.org/patches/fullgaps/
- autostart : https://dwm.suckless.org/patches/autostart/
- systray  : https://dwm.suckless.org/patches/systray/
- fullscreen : https://dwm.suckless.org/patches/fullscreen/
- Added dynamic clock in dmw.c (like a true savage), its not the best but it is doing what is asked.

### The clock :
   
Was added modifying run and update status function, 

- The clock is created in updatestatus() function.
- Update is done with run().

This implementation goes out of DWM devs philosophy, feel free to improve it if it is a necessity :)


