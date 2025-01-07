**`!`**
> run `firefox-custom.sh` after the first launch of regular Firefox
>
> `ly.sh` might not work as you expected
> 
> `display.sh` and `cursor.sh` do not run in TTY


```mermaid
graph TD;
    bspwmrc -->|move| .config/bspwm
    sxhkdrc -->|move| .config/bspwm
    alacritty.toml -->|move| .config/alacritty
    .xsession -->|move| HOME
    .bashrc -->|move| HOME
    firefox -->|move| /opt
    init.vim -->|move| .config/nvim
    nvim-theme.vim -->|move| .config/nvim/colors
```

```stl

```
