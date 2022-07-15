SHELL = /bin/bash

TARGET_SCRIPT_NAME = xdg-wrapper
TARGET_FOLDER_INSTALLATION = /usr/local/bin
AUTO_COMPLETE_PATH = $(XDG_DATA_HOME)/bash-completion/completions

SOURCE_SCRIPT_NAME = xdg-wrapper

# Style codes
GREEN = \033[0;32m
NS = \033[0m
DONE = $(GREEN)Done

# =====================================================

default:
	@echo -e "Use 'make install' to copy $(TARGET_SCRIPT_NAME) into $(TARGET_FOLDER_INSTALLATION) and add autocomplete to $(AUTO_COMPLETE_PATH)"

install: install-script install-tab-completion

install-script:
	@echo "- Installing '$(SOURCE_SCRIPT_NAME)' into '$(TARGET_FOLDER_INSTALLATION)/'..."
	@chmod +x $(SOURCE_SCRIPT_NAME)
	@cp xdg-wrapper $(TARGET_FOLDER_INSTALLATION)/$(TARGET_SCRIPT_NAME)
	@echo -e "$(DONE)$(NS)"

install-tab-completion:
	@echo -e "- Adding bash-completion online script into:"
	@echo -e "  \"$(AUTO_COMPLETE_PATH)\""
	@mkdir -p "$(AUTO_COMPLETE_PATH)"
	@echo -e "#!/usr/bin/env bash\ncomplete -c xdg-wrapper" > $(AUTO_COMPLETE_PATH)/$(SOURCE_SCRIPT_NAME)
	@echo -e "$(DONE)$(NS)"

version:
	@echo "Updating subversion..."
	@sed -ri 's/(SCRIPT_VERSION=)\"([0-9])\.(.*)\"/echo "\1\\"\2.$$((\3+1))\\""/ge' xdg-wrapper
	@sed -nr 's/SCRIPT_VERSION="([0-9]\..*)"/Updated to version: \1/p' xdg-wrapper
	@echo -e "$(DONE)$(NS)"

