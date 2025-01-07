**`!`**
> run `firefox-custom.sh` after the first launch of regular Firefox
>
> `ly.sh` might not work as you expected
> 
> `display.sh` and `cursor.sh` do not run in TTY
> 
|-------------------|--------------------------------|
| alacritty         | Terminal emulator             |
|-------------------|--------------------------------|
| sxhkd             | Hotkey daemon                 |
|-------------------|--------------------------------|
| ranger            | File manager                  |
|-------------------|--------------------------------|
| neovim            | Text editor                   |
|-------------------|--------------------------------|
| feh               | Image viewer                  |
|-------------------|--------------------------------|
| gnome-keyring     | Keyring manager               |
|-------------------|--------------------------------|
| ttf-dejavu        | Font                          |

<details>
<summary>components</summary>

| package | about |
|-----:|-----------|
|     1| JavaScript|
|     2| Python    |
|     3| SQL       |

</details>

```mermaid
graph TD;
    A[install.sh] --> B[Install Packages] --> C[bspwm, alacritty, sxhkd, ranger, neovim, feh, gnome-keyring, xorg-xsetroot, xorg-xrandr, ttf-dejavu];
    A --> D[Create Directories] --> E["$HOME/.config/bspwm", "$HOME/.config/alacritty"];
    A --> F[Move Files] --> G["$HOME/bspwm/dotfiles/bspwmrc" --> "$HOME/.config/bspwm"];
    F --> H["$HOME/bspwm/dotfiles/sxhkdrc" --> "$HOME/.config/bspwm"];
    F --> I["$HOME/bspwm/dotfiles/alacritty.toml" --> "$HOME/.config/alacritty"];
    F --> J["$HOME/bspwm/dotfiles/.xsession" --> "$HOME/"];
    A --> K[Set Permissions] --> L["$HOME/.config/bspwm/bspwmrc", "$HOME/.xsession", "$HOME/bspwm/scripts/*.sh", "$HOME/bspwm/firefox/*.sh", "$HOME/bspwm/service/*.sh"];
    A --> M[Install Additional Packages] --> N[yay, cava, spotify, neofetch, openrgb, openjdk, gradle, vscode, flameshot];
    A --> O[Enable ly.service];
```

```stl
solid heart
  facet normal 0 0 1
    outer loop
      vertex 0 0 0
      vertex 1 0 0
      vertex 0 1 0
    endloop
  endfacet
  facet normal 0 0 -1
    outer loop
      vertex 0 0 0
      vertex 0 1 0
      vertex 1 0 0
    endloop
  endfacet
  facet normal 0 1 0
    outer loop
      vertex 0 1 0
      vertex 1 0 0
      vertex 1 1 0
    endloop
  endfacet
  facet normal 1 0 0
    outer loop
      vertex 1 0 0
      vertex 0 0 0
      vertex 1 1 0
    endloop
  endfacet
endsolid
```
