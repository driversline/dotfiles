```mermaid
graph TD;
    classDef default fill:#000,stroke:#fff,stroke-width:1px,color:#fff;
    environment-->bspwm;
    terminal-->alacritty;
    editor-->neovim;
    binds-->sxhkd;
```

```bash
gnome-keyring-daemon --start --components=secrets
```

[Cursor](dotfiles/cursors/Nordzy-cursors-white.tar.gz) - [Source Code](https://github.com/guillaumeboehm/Nordzy-cursors)
