XDG-Wrapper
===========

A BASH script to launch non xdg compilant programs to fake a XDG structure. It
will move the `$XDG_DATA_HOME/APP` folder to `$HOME/.APP` before launch and
move to `XDG_DATA_HOME/APP` the folder when the programm is closed.

## Usage

When running for the first time a program with `xdg-wrapper` the script make a
list of files and folders before and after the execution and store in a little
text file to handle the hidden directories and files. Is ***strongly
recommended*** to close the program on its first run with the script as soon as
posible to get a clean file list. This list is used by the script to move files
on program run and close between `$HOME` and the `$XDG_DATA_HOME` folder.

### From the terminal:

```command
xdg-wrapper [PROGRAM] [ARGS]

$ xdg-wrapper -help
```

### With KDE:

1. Open `kmenuedit` (Right click on KDE menu → Edit applications).
2. Find the program in the **Search bar**, e.g. _"Audacity"_, and click on it.
3. In the **Command** section add xdg-wrapper before the binary. For Audacity:

Command before:
```
env UBUNTU_MENUPROXY=0 audacity %F
```

Command after:
```
env UBUNTU_MENUPROXY=0 xdg-wrapper audacity %F
```
4. Save
5. Launch the program from the KDE menu or Krunner.

