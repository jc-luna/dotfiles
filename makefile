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
	@echo "make all:	Create or update symlinks to dotfiles everywhere. Currently nonfunctional."
	@echo "make force:	Create symlinks, overriding "
	@echo "make clean:	Clean up all symlinks."
	@echo "make help:	Display this dialog."
	@echo

.PHONY: home
home:
	@echo "Creating symlinks in $$HOME"
	stow --verbose --target=$$HOME --restow home
	@echo "Done!"

.PHONY: all
all:
	@echo "Creating symlinks everywhere. This actually isn't doing anything btw."
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
