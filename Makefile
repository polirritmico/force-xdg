SHELL = /bin/bash

SOURCE_SCRIPT_NAME = force-xdg

TARGET_FOLDER_INSTALLATION = /usr/local/bin
TARGET_SCRIPT_NAME = force-xdg
AUTO_COMPLETE_PATH = $(XDG_DATA_HOME)/bash-completion/completions

# Style codes
GREEN = \033[0;32m
NS = \033[0m
DONE = $(GREEN)Done

# =====================================================

default:
	@echo -e "Use $(GREEN)'make install'$(NS) to copy $(TARGET_SCRIPT_NAME)" \
			 "into $(TARGET_FOLDER_INSTALLATION)/ and to add autocomplete" \
			 "\nin $(AUTO_COMPLETE_PATH)"

install: install-script install-tab-completion

install-script:
	@echo "- Installing '$(SOURCE_SCRIPT_NAME)' into '$(TARGET_FOLDER_INSTALLATION)/'..."
	@chmod +x $(SOURCE_SCRIPT_NAME)
	@cp $(SOURCE_SCRIPT_NAME) $(TARGET_FOLDER_INSTALLATION)/$(TARGET_SCRIPT_NAME)
	@echo -e "  $(DONE)$(NS)"

install-tab-completion:
	@echo -e "- Adding bash-completion online script into:"
	@echo -e "  \"$(AUTO_COMPLETE_PATH)\""
	@mkdir -p "$(AUTO_COMPLETE_PATH)"
	@echo -e "#!/usr/bin/env bash\ncomplete -c $(TARGET_SCRIPT_NAME)" > $(AUTO_COMPLETE_PATH)/$(TARGET_SCRIPT_NAME)
	@echo -e "  $(DONE)$(NS)"

version:
	@echo "Updating subversion..."
	@sed -ri 's/(SCRIPT_VERSION=)\"([0-9])\.(.*)\"/echo "\1\\"\2.$$((\3+1))\\""/ge' $(SOURCE_SCRIPT_NAME)
	@sed -nr 's/SCRIPT_VERSION="([0-9]\..*)"/Updated to version: \1/p' $(SOURCE_SCRIPT_NAME)
	@echo -e "$(DONE)$(NS)"

