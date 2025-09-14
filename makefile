
.PHONY: help
help:
	@echo
	@echo -e "LUNA DOTFILES\n"
	@echo "make home:	Create symlinks to dotfiles in your home directory."
	@echo "make all:	Create symlinks to dotfiles everywhere. Currently nonfunctional."
	@echo "make clean:	Clean up symlinks."
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
	@echo "Done! I think..."

.PHONY: clean
clean:
	@echo "Cleaning up all symlinks..."
	stow --verbose --target=$$HOME --delete home
	@echo "Done!"
