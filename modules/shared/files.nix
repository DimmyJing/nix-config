{ config, pkgs, ... }:
{
  "./.config/nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
}
