{ pkgs ? import <nixpkgs> {} }:

let
  packages = [
    pkgs.bspwm
    pkgs.alacritty
    pkgs.sxhkd
    pkgs.ranger
    pkgs.neovim
    pkgs.picom
    pkgs.feh
    pkgs.gnome-keyring
    pkgs.xsetroot
    pkgs.xrandr
    pkgs.ttf-dejavu
  ];
in
  pkgs.mkShell {
    buildInputs = packages;
  }
