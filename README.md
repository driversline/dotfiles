```mermaid
graph TD;
    classDef default fill:#1a1a1a,stroke:#fff,stroke-width:1px,color:#fff,shadow:0px 0px 10px #fff,font-size:16px,font-family:Arial;
    session-->x11;
    environment-->bspwm;
    terminal-->alacritty;
    editor-->neovim;
    binds-->sxhkd;
```

```bash
gnome-keyring-daemon --start --components=secrets
```

[Cursor](dotfiles/cursors/Nordzy-cursors-white.tar.gz) - [Source Code](https://github.com/guillaumeboehm/Nordzy-cursors)
