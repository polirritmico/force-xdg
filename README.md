Force-XDG :house::wrench:
===========================

A BASH script to force non-compliant _XDG Base Directory_ programs to store
their hidden dot folders and files in the XDG Data path instead of polluting
`$HOME`.

![Force-XDG running](docs/screenshot_01.png)

## Description

When the program is launched, the script will move the content of the
`$XDG_DATA_HOME/Force-XDG/APP/` folder into `$HOME` and after closing it will
move the folders and files back to `$XDG_DATA_HOME/Force-XDG/APP/`.

> _Moving files on the same filesystem in GNU/Linux is really fast since only
> the_ directory entries _are modified._

For example if ***Steam*** is launched through Force-XDG:

```command
$ force-xdg steam
```

It will move from `~/.local/share/Force-XDG/steam/` the folders and files
`pki/`, `steam/`, `steampath` and `steampid` to `~/.pki`, `~/.steam`,
`~/.steampath` and `~/.steampid` accordingly. After ***Steam*** is closed, it
will move those elements back to `~/.local/share/Force-XDG/steam/`.

![Example](docs/example.png)

## Installation

Just copy the script to `/usr/local/bin/` or any location of your paths. As an
alternative `make` can be used to do it automatically (which also install BASH
auto-completion):

```
git clone https://github.com/polirritmico/force-xdg.git
make install
```

## Usage

### First run:

When the program is run through Force-XDG for the first time, the script will
read the state of the dot folders and files of home and compare it with the
state after closing the program, saving the list of new folders and files into
`$XDG_DATA_HOME/Force-XDG/db`. For example:

```command
$ cat ~/.local/share/Force-XDG/db | grep steam
steam;steampid;steampath;steam;pki;
```
 
> Is ***strongly recommended*** to close the program as soon as posible on its
> first run to get a clean file list as any dot-folder or file generated while
> the program is running for first time will be added to the program's list.

### From the terminal:

```command
$ force-xdg PROGRAM
```

```
$ force-xdg -help

Force-XDG v0.1
A simple BASH script to simulate XDG paths and clean HOME.

Usage: force-xdg [OPTION]... [PROGRAM]
       force-xdg [OPTION]... [PROGRAM] [PROGRAM ARGS]

Move hidden polluting files from [HOME] to [XDG_DATA_HOME]/Force-XDG/ folder.
When [PROGRAM] is run for the first time is STRONGLY RECOMMENDED to close it
immediately to get a clean file list. The script compare the state of [HOME]
before and after the first execution to make a folders and files list based on
the changes.

Options:
  -c|custom        Change the program identifier to a custom one. Usefull when
                   launching programs from scripts or when the same program
                   could be initialized from symlinks with different filenames.
  -f|folder        Manually setup the destination folder
                   ($XDG_DATA_HOME/Force-XDG by default)
  -h|help          Display this help message.
  -v|version       Display the version of Force-XDG and exit.
```

### With KDE:

Force-XDG works great with KDE, simply edit the program launcher:

1. Open the KDE main menu.
2. Find the program → Right click → "Edit application" → Application tab.
3. In the **Command** section, add _force-xdg_ before the binary call.
4. Save.
5. Launch the program from the KDE menu or Krunner.
6. Close the program.
7. Enjoy a clean home folder.

For example let's configure _Audacity_:

On `kmenuedit`, search for _"Audacity"_ and click on the proper result.
The command section should read something like this:

```
env UBUNTU_MENUPROXY=0 audacity %F
```
It has a "env variable" (most launchers don't have that), then the program, and
finally a "place holder". Simply adding ***force-xdg*** before the command
will do the trick:

```
env UBUNTU_MENUPROXY=0 force-xdg audacity %F
```

Done!

