#######################################
###                                 ###
###     LUNA DOTFILES MAKEFILE      ###
###                                 ###
#######################################

OTHER_STOW_OPTS =
STOW_ACTION = --restow

ifdef ADOPT
	STOW_ACTION = --adopt 
endif


.PHONY: help
help:
	@echo
	@echo -e "LUNA DOTFILES"
	@echo
	@echo "make home:	Create or update symlinks to all dotfiles in your home directory."
	@echo "make force:	Create symlinks, overriding ones that already exist."
	@echo "make clean:	Clean up all symlinks."
	@echo "make help:	Display this dialog."
	@echo

.PHONY: home
home:
	@echo "Creating symlinks in $$HOME"
	stow --verbose --target=$$HOME
		$(OTHER_STOW_OPTS) $(STOW_ACTION) home
	@echo "Done!"

.PHONY: clean
clean:
	@echo "Cleaning up all symlinks..."
	stow --verbose --target=$$HOME --delete home
	stow --verbose --target=$$HOME --dir=./shell --delete bash
	@echo "Done!"

.PHONY: bash
bash:
	@echo "Symlinking .bashrc..."
	stow --verbose --target=$$HOME --dir=./shell \
		$(OTHER_STOW_OPTS) $(STOW_ACTION) bash

.PHONY: fastfetch
fastfetch:
ifndef FASTFETCH_CFG
		@echo "You must specify a configuration! Valid ones are:"\
		ls ./fastfetch\
else
		@echo "Symlinking given fastfetch config..."\
		stow --verbose --target=$$HOME --dir=./fastfetch \
		$(OTHER_STOW_OPTS) $(STOW_ACTION) $(FASTFETCH_CFG)\
endif
