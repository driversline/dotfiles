**`!`**
> run `firefox-custom.sh` after the first launch of regular Firefox
>
> `ly.sh` might not work as you expected
> 
> `display.sh` and `cursor.sh` do not run in TTY


```mermaid
graph TD;
    bspwmrc["$HOME/bspwm/dotfiles/bspwmrc"] -->|move| bspwm_config["$HOME/.config/bspwm"]
    sxhkdrc["$HOME/bspwm/dotfiles/sxhkdrc"] -->|move| bspwm_config
    alacritty_toml["$HOME/bspwm/dotfiles/alacritty.toml"] -->|move| alacritty_config["$HOME/.config/alacritty"]
    xsession["$HOME/bspwm/dotfiles/.xsession"] -->|move| home["$HOME/"]

    bashrc["$HOME/bspwm/scripts/bash/.bashrc"] -->|move| home

    firefox["Extracted Firefox"] -->|move| opt["/opt"]
    opt -->|symlink| usr_local_bin["/usr/local/bin/firefox"]

    nvim_init["$HOME/bspwm/scripts/nvim/init.vim"] -->|move| nvim_config["$HOME/.config/nvim"]
    nvim_theme["$HOME/bspwm/scripts/nvim/nvim-theme.vim"] -->|move| nvim_colors["$HOME/.config/nvim/colors"]
    nvim_config --> nvim_colors
```

```stl

```
