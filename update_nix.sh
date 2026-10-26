#!/bin/bash
sudo nix flake update --flake flake.nix
sudo nixos-rebuild switch --flake /home/mel/repos/dotfiles#linux-thinkpad --impure
