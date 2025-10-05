#######################################
###                                 ###
###     LUNA DOTFILES MAKEFILE      ###
###                                 ###
#######################################

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
	stow --verbose --target=$$HOME --restow home
	@echo "Done!"

.PHONY: force
force:
	@echo "This will forcefully override matching files."
	@read -p "Do you continue? (Y/n) " choosen;\
		if [ $$choosen = "Y" ];\
		then echo "Overriding!" && stow --verbose --adopt --target=$$HOME --restow home;\
		else echo "Aborting!";\
		fi

.PHONY: clean
clean:
	@echo "Cleaning up all symlinks..."
	stow --verbose --target=$$HOME --delete home
	@echo "Done!"

.PHONY: general
general:
	@echo "Linking various configuration files..."
	stow --verbose --target=$$HOME --restow home

.PHONY: bash
bash:
	@echo "Symlinking.. .bashrc"
	stow --verbose --target=$$HOME --restow shell/bash/
	
