{ config, pkgs, lib, home-manager, ... }:

let
  # Define the content of your file as a derivation
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit config pkgs; };
in
{
  config = {
    # It me
    users.users.jimmy = {
      name = "jimmy";
      home = "/Users/jimmy";
      isHidden = false;
      shell = pkgs.zsh;
    };

    homebrew = {
      enable = true;
      casks = pkgs.callPackage ./casks.nix {};

      # These app IDs are from using the mas CLI app
      # mas = mac app store
      # https://github.com/mas-cli/mas
      #
      # $ nix shell nixpkgs#mas
      # $ mas search <app name>
      #
      masApps = {
        # "1password" = 1333542190;
        # "wireguard" = 1451685025;
        "things3" = 904280696;
      };
    };

    services.yabai = {
      enable = true;
    };

    # Enable home-manager
    home-manager = {
      useGlobalPkgs = true;
      users.jimmy = { pkgs, config, lib, ... }: {
        home = {
          enableNixpkgsReleaseCheck = false;
          packages = pkgs.callPackage ./packages.nix {};
          file = lib.mkMerge [
            sharedFiles
            additionalFiles
          ];
          stateVersion = "23.11";
        } // import ../shared/home.nix { inherit config pkgs lib; };
        programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };
      };
    };
  };
}
