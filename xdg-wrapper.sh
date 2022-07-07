#!/usr/bin/env bash

#=== SH_SCRIPT  ================================================================
#         NAME:   XDG-Wrapper
#  DESCRIPTION:   A simple BASH script to simulate XDG paths and clean HOME.
#         DATE:   2022/07/07
#===============================================================================

# e - script stops on error (return !=0)
# u - error if undefined variable
# o pipefail - script fails if one of piped command fails
# x - output each line (debug)
set -euo pipefail


#-----------------------------------------------------------------------
#  Global settings
#-----------------------------------------------------------------------
SCRIPT_VERSION="0.1"
SHORT_DESCRIPTION="A simple BASH script to simulate XDG paths and clean HOME."
SCRIPT_NAME="XDG-Wrapper"

# Terminal output font styles and colors
GREEN="\033[0;32m"
ORANGE="\033[0;33m"
NC="\033[0m" # No color
BOLD="\e[1m" # Bold text style
IT="\e[3m"   # Italic text style
DF="\e[0m"   # Default style

# Get the real script filename even through a symbolic link
SCRIPT_RUN="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"



#===  FUNCTION  ================================================================
#         NAME:   Version
#  DESCRIPTION:   Show script name, script version and short description.
#===============================================================================
function version()
{
    echo -e "$SCRIPT_NAME v$SCRIPT_VERSION, ${SHORT_DESCRIPTION,}"

}  # ------------  end of function version  ------------



#===  FUNCTION  ================================================================
#         NAME:   Help
#  DESCRIPTION:   Show the script usage and documentation help.
#===============================================================================
function help()
{
    echo -e "Usage: $SCRIPT_RUN [OPTION]... [PROGRAM]

Options:
  -f|folder        Manually setup destination folder (XDG_DATA_HOME by default)
  -h|help          Display this help message.
  -v|version       Display the version of $SCRIPT_NAME and exit."

}  # ------------  end of function help  ------------

#-------------------------------------------------------------------------------
#  Default variables
#-------------------------------------------------------------------------------

custom_folder=false
DIFF_FILE="$XDG_CACHE_HOME"/XDG-Wrapper/diff


#-------------------------------------------------------------------------------
#  Handle command line arguments
#-------------------------------------------------------------------------------
while getopts ":hv" opt
    do
        case $opt in
            h|help)
                version
                help
                exit 0
                ;;
            v|version)
                version
                exit 0
                ;;
            f|folder)
                custom_folder = true
                ;;
            :)
                echo -e "$SCRIPT_NAME: Invalid option: '-$OPTARG' requires an argument\n"
                help
                exit 1
                ;;
            *)
                echo -e "$SCRIPT_NAME: Invalid option: '-$OPTARG'\n"
                help
                exit 1
                ;;
    esac
done
shift $(($OPTIND-1))



#===============================================================================
# BEGINNING OF SCRIPT WORK
#===============================================================================

#-------------------------------------------------------------------------------
# Prepare paths
#-------------------------------------------------------------------------------
