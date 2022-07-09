XDG-Wrapper
===========

A BASH script to launch non xdg compilant programs to fake a XDG structure. It
will move the `$XDG_DATA_HOME/APP` folder to `$HOME/.APP` before launch and
move to `XDG_DATA_HOME/APP` the folder when the programm is closed.

## Usage

```command
xdg-wrapper [PROGRAM] [ARGS]
```

