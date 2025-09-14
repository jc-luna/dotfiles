# LUNA DOTFILES

My dotfiles!

## Operation
This is controlled by a makefile and `stow`.
Display a help dialog by running `make` without arguments or explictly with `make help`.

To symlink dotfiles into your home directory:
```bash
make home
```

To symlink system dotfiles.... when I come to making some:
```bash
make sys
```

To symlink your home and system dotfiles:
```bash
make all
```

To forcefully override your home and system dotfiles:
```bash
make force
```

To clean up symlinks from your home and system directories:
```bash
make clean
```
