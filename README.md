XDG-Wrapper :house::barber:
===========================

A BASH script to force non-compliant _XDG Base Directory_ programs to store
their hidden dot folders and files in the XDG Data path instead of polluting
`$HOME`.

## Description

When the program is launched, the script will move the content of the
`$XDG_DATA_HOME/XDG-Wrapper/APP/` folder into `$HOME` and after closing it will
move the folders and files back to `$XDG_DATA_HOME/XDG-Wrapper/APP/`.

For example if ***Steam*** is launched through XDG-Wrapper:

```command
$ xdg-wrapper steam
```

It will move from `~/.local/share/XDG-Wrapper/steam/` the folders and files
`pki/`, `steam/`, `steampath` and `steampid` to `~/.pki`, `~/.steam`,
`~/.steampath` and `~/.steampid`. After ***Steam*** is closed, it will move
those elements back to `~/.local/share/XDG-Wrapper/steam/`.

To generate the list of files and folders created by the program, when the
program is launched for the first time (no previous `~/.program` folders and
files exists) the script will read the state of home dot folders and files, and
compare it with the state after closing the program.

## Installation

Just copy the script to `/usr/local/bin/` or any location of your paths.
As an alternative, `make` can be used to do it automatically (which also
install BASH auto-completion):

```
git clone https://github.com/polirritmico/xdg-wrapper.git
make install
```

## Usage

**On first program run:**

> Is ***strongly recommended*** to close the program as soon as posible on its
> first run to get a clean file list, as any dot-folders or files generated while
> the program is running for first time will be added to the program's list.

### From the terminal:

```command
$ xdg-wrapper PROGRAM
```

```
$ xdg-wrapper -help

XDG-Wrapper v0.1
A simple BASH script to simulate XDG paths and clean HOME.

Usage: xdg-wrapper [OPTION]... [PROGRAM]
       xdg-wrapper [OPTION]... [PROGRAM] [PROGRAM ARGS]

Move hidden polluting files from [HOME] to [XDG_DATA_HOME]/XDG-Wrapper/ folder.
When [PROGRAM] is run for the first time is STRONGLY RECOMMENDED to close it
immediately to get a clean file list. The script compare the state of [HOME]
before and after the first execution to make a folders and files list based on
the changes.

Options:
  -c|custom        Change the program identifier to a custom one. Usefull when
                   launching programs from scripts or when the same program
                   could be initialized from symlinks with different filenames.
  -f|folder        Manually setup the destination folder
                   ($XDG_DATA_HOME/XDG-Wrapper by default)
  -h|help          Display this help message.
  -v|version       Display the version of XDG-Wrapper and exit.
```

### With KDE:

XDG-Wrapper works great with KDE, simply edit the program launcher:

1. Open `kmenuedit` (Right click on KDE menu → Edit applications).
2. Find the program with the **Search bar** and click on its icon.
3. In the **Command** section add xdg-wrapper before the binary.
4. Save.
5. Launch the program from the KDE menu or Krunner.

For example lets config _Audacity_:

On `kmenuedit`, search for _"Audacity"_ and click the proper result.
The command section reads this:

```
env UBUNTU_MENUPROXY=0 audacity %F
```

It has a "env variable", then the program, and finally a "place holder". Just
add xdg-wrapper before the command will do the trick:

```
env UBUNTU_MENUPROXY=0 xdg-wrapper audacity %F
```

