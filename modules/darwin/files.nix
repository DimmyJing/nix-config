{ pkgs, config, ... }:
{
  ".config/karabiner/karabiner.json" = {
    source = ./config/karabiner.json;
  };
}
