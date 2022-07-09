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
$ xdg-wrapper -help
```

> XDG-Wrapper v0.1
> A simple BASH script to simulate XDG paths and clean HOME.
>
> Usage: xdg-wrapper [OPTION]... [PROGRAM]
> xdg-wrapper [OPTION]... [PROGRAM] [PROGRAM ARGS]
>
> Move hidden polluting files from [HOME] to [XDG_DATA_HOME]/XDG-Wrapper/ folder.
> When [PROGRAM] is run for the first time is STRONGLY RECOMMENDED to close it
> immediately to get a clean file list. The script compare the state of [HOME]
> before and after the first execution to make a folders and files list based on
> the changes.
>
> Options:
> -f|folder        Manually setup destination folder
>                  ($XDG_DATA_HOME/XDG-Wrapper by default)
> -h|help          Display this help message.
> -v|version       Display the version of XDG-Wrapper and exit.


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

