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

    style bspwmrc fill:#f9f,stroke:#333,stroke-width:2px;
    style sxhkdrc fill:#f96,stroke:#333,stroke-width:2px;
    style alacritty_toml fill:#6f9,stroke:#333,stroke-width:2px;
    style xsession fill:#96f,stroke:#333,stroke-width:2px;
    style bspwm_config fill:#9f6,stroke:#333,stroke-width:2px;
    style alacritty_config fill:#f69,stroke:#333,stroke-width:2px;
    style home fill:#69f,stroke:#333,stroke-width:2px;
```

```stl

```
