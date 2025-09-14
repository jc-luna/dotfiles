#######################################
###									###
###		LUNA DOTFILES MAKEFILE		###
###									###
#######################################

.PHONY: help
help:
	@echo
	@echo -e "LUNA DOTFILES\n"
	@echo "make home:	Create or update symlinks to dotfiles in your home directory."
	@echo "make sys:	Create or update symlinks to dotfiles in system directories. Currently nonfunctional."
	@echo "make all:	Create or update symlinks to system and user dotfiles."
	@echo "make force:	Create symlinks, overriding "
	@echo "make clean:	Clean up all symlinks."
	@echo "make help:	Display this dialog."
	@echo

.PHONY: home
home:
	@echo "Creating symlinks in $$HOME"
	stow --verbose --target=$$HOME --restow home
	@echo "Done!"

.PHONY: sys
sys:
	@echo "Creating systemwide symlinks... Not!"
	@echo "Not actually doing anything here because there are no system dotfiles!"

.PHONY: all
all:
	@echo "Creating symlinks everywhere. This actually isn't doing anything that make home doesn't do."
	stow --verbose --target=$$HOME --restow home
	@echo "Done! I think..."

.PHONY: force
force:
	@echo "This will forcefully override matching files."
	@read -p "Do you continue? (Y/n) " choosen; if [ $$choosen == "Y" ]; then echo "Overriding!" && stow --verbose --adopt --target=$$HOME --restow home; else echo "Aborting!"; fi

.PHONY: clean
clean:
	@echo "Cleaning up all symlinks..."
	stow --verbose --target=$$HOME --delete home
	@echo "Done!"
