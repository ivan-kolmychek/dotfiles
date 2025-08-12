NOTE: this repo has been moved to codeberg, see https://codeberg.org/ivan-kolmychek/dotfiles

# dotfiles

various configuration files

# bash
- `ln -vs "$(pwd)/basrhc" "~/.bashrc"`
- `mkdir ~/.bashrc.d`
- link or copy files from `.bashrc.d.examples`

# zsh

-`ln -vs "$(pwd)/zshrc" "~/.zshrc"`
- `mkdir ~/.zshrc.d`
- link or copy files from `.zshrc.d.examples`

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
- zsh: `ln -vs "$(pwd)/zshrc.d.examples/rust-analyzer-bin-add-to-path.zsh" "${HOME}/.zshrc.d/75-rust-analyzer-bin-add-to-path.zsh"`

# sway

```
mkdir ~/.config/sway
ln -vs $(pwd)/sway-config ~/.config/sway/config
```

# i3status-rs

```
mkdir ~/.config/i3status-rust
ln -vs $(pwd)/i3status-rust.toml ~/.config/i3status-rust/config.toml
```

# kanshi

```
mkdir ~/.config/kanshi
ln -vs $(pwd)/kanshi-config ~/.config/kanshi/config
```

# waybar
```
mkdir ~/.config/waybar
ln -vs $(pwd)/waybar-config.jsonc ~/.config/waybar/config.jsonc
ln -vs $(pwd)/waybar-style.css ~/.config/waybar/style.css
ln -vs $(pwd)/waybar-power_menu.xml ~/.config/waybar/power_menu.xml
```

