# dotfiles

various configuration files

# bash

# gnupg

```
ln -vs "$(pwd)/gpg-agent.conf" ~/.gnupg/gpg-agent.conf
```

# xprofile
```
ln -s "$(pwd)/xprofile-$(hostname)" "${HOME}/.xprofile"
```

# ra-multiplex

```
mkdir ~/.config/ra-multiplex
ln -vs $(pwd)/ra-multiplex/config.toml ~/.config/ra-multiplex/config.toml
```

rust-analyzer var:
```
ln -vs "$(pwd)/zshrc.d.examples/rust-analyzer-bin-add-to-path.zsh" "${HOME}/.zshrc.d/75-rust-analyzer-bin-add-to-path.zsh"
```
