#!/bin/bash
sudo nix-collect-garbage -d
nix-collect-garbage -d
nix-store --optimise
sudo nix flake update --flake flake.nix
sudo nixos-rebuild switch --flake /home/mel/repos/dotfiles#linux-thinkpad --impure
