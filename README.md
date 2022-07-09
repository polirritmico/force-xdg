XDG-Wrapper
===========

A BASH script to launch non xdg compilant programs to fake a XDG structure. It
will move the `$XDG_DATA_HOME/APP` folder to `$HOME/.APP` before launch and
move to `XDG_DATA_HOME/APP` the folder when the programm is closed.

## Usage

```command
$ xdg-wrapper -help
```

### From the terminal:

```command
xdg-wrapper [PROGRAM] [ARGS]
```

### With KDE:

1. Open `kmenuedit` (Right click on KDE menu → Edit applications).
2. Find the program in the Search bar, e.g. Audacity, and click on it.
3. In the Command section add xdg-wrapper before the binary:

Command before:
```
env UBUNTU_MENUPROXY=0 audacity %F
```

Command after:
```
> env UBUNTU_MENUPROXY=0 xdg-wrapper audacity %F
```
4. Save
