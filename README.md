Force-XDG :house::wrench:
===========================
![GitHub last commit](https://img.shields.io/github/last-commit/polirritmico/force-xdg)  [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A BASH script to force non-compliant _XDG Base Directory_ programs to store
their hidden dot folders and files in the XDG Data path instead of polluting
`$HOME`.

![Force-XDG running](docs/screenshot_01.png)


## TL;DR

Just call the script with the program and its args or paths:

```command
$ force-xdg program --example -n options "/path/to/file"
```

It will store the dot folders/files inside `$XDG_DATA_HOME/Force-XDG/program`.

For help:

```command
$ force-xdg -h
```

-------------------------------------------------------------------------------

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
![Example](docs/example.png)

It will move from `~/.local/share/Force-XDG/steam/` the folders and files
`pki/`, `steam/`, `steampath` and `steampid` to `~/.pki`, `~/.steam`,
`~/.steampath` and `~/.steampid` accordingly. After ***Steam*** is closed, it
will move those elements back to `~/.local/share/Force-XDG/steam/`.


### Alternative: Fake Home Mode

```command
$ force-xdg -f steam
```

In this mode instead of getting the file list and move dirs and files, the
script will simply change the `$HOME` environment variable value to
`$XDG_DATA_HOME/Force-XDG/fake_home` so all dirs and folders are generated and
stored on that folder.


## Installation

Just copy the script to `/usr/local/bin/` or any location in your `PATH`. As an
alternative `make` can be used to do it automatically (Permissions may need to
be adjusted if used as normal user. This also install a BASH auto-completion
entry in `XDG_DATA_HOME`):

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

### Fake Home Mode

Sets the `$HOME` env value to `$XDG_DATA_HOME/Force-XDG/fake_home`. The script
will also store the _fake home_ option on the database so no further `-f` arg
calls are needed.

First run:

```command
$ force-xdg -f PROGRAM
```
Then `-f` is no longer needed:

```command
$ force-xdg PROGRAM
```

```command
$ cat $XDG_DATA_HOME/Force-XDG/db | grep PROGRAM
PROGRAM;FAKEHOME;
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
![Config app launcher through kmenuedit screenshot](docs/screenshot_02.png)

Done!

