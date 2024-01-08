{ config, pkgs, ... }:

{
  imports = [
    ../../modules/darwin/home-manager.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Setup user, packages, programs
  nix = {
    package = pkgs.nixUnstable;
    settings.trusted-users = [ "@admin" "jimmy" ];
    settings.experimental-features = "nix-command flakes";
  };

  programs.zsh.enable = true;

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs; import ../../modules/shared/packages.nix { inherit pkgs; };

  # Enable fonts dir
  fonts.fontDir.enable = true;

  system = {
    stateVersion = 4;

    defaults = {
      LaunchServices = {
        # "Application Downloaded from Internet" popup will not display
        LSQuarantine = false;
      };

      NSGlobalDomain = {
        # Show all file extensions inside the Finder
        AppleShowAllExtensions = true;
        # Repeats the key as long as it is held down.
        ApplePressAndHoldEnabled = false;

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 2;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 15;

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };

      dock = {
        autohide = true;
        show-recents = false;
        launchanim = true;
        mouse-over-hilite-stack = true;
        orientation = "bottom";
        tilesize = 64;
      };

      finder = {
        _FXShowPosixPathInTitle = false;
      };

      trackpad = {
        Clicking = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
