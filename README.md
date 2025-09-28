# LUNA DOTFILES

My dotfiles!

## Operation
This is controlled by a makefile and `stow`.
Display a help dialog by running `make` without arguments or explictly with `make help`.

To symlink dotfiles into your home directory:
```bash
make home
```

To forcefully override your dotfiles:
```bash
make force
```

To clean up symlinks from your home and system directories:
```bash
make clean
```
