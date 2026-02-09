# LUNA DOTFILES
## Operation
This uses Julia and stow.

For help:
```sh
./lunadotfiles --help
```

For various application-specific configuration files:
```sh
./lunadotfiles deploy home
```

For specific shell configuration files, like zsh, for example:
```sh
./lunadotfiles deploy zsh
```

For the Julia config:
```sh
./lunadotfiles deploy julia
```

For the fetch, like the default Arch Linux one, for example:
```sh
./lunadotfiles deploy fastfetch archdefault
```

Cleanup is done with `./lunadotfiles clean TARGET SUBTARGET`.
Other utilities that I use are in `extra`.
