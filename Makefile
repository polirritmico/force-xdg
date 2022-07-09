SHELL = /bin/bash

TARGET_SCRIPT_NAME = xdg-wrapper
TARGET_FOLDER_INSTALLATION = /usr/local/bin

SOURCE_SCRIPT_NAME = xdg-wrapper

# Style codes
GREEN = \033[0;32m
ORANGE = \033[0;33m
ITLC = \033[3m
NS = \033[0m
DONE = $(GREEN)Done

# =====================================================

default:
	@echo -e "Use 'make install' to copy $(TARGET_SCRIPT_NAME) into $(TARGET_FOLDER_INSTALLATION)"

install:
	@chmod +x $(SOURCE_SCRIPT_NAME)
	@cp xdg-wrapper $(TARGET_FOLDER_INSTALLATION)/$(TARGET_SCRIPT_NAME)
	@echo -e "$(DONE)$(NS)"

