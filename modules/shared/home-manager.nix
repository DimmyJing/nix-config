{ config, pkgs, lib, ... }:

{
  zsh = {
    enable = true;
    shellAliases = {
      src = "cd ~/Workspace";
      ls = "ls -G --color=auto";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "extract" "safe-paste" "tmux" ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./config;
        file = "p10k.zsh";
      }
    ];
    syntaxHighlighting = {
      enable = true;
    };
    initExtra = ''
      export PATH="$HOME/.local/share/gem/ruby/3.3.4/bin:$PATH"
      export GEM_HOME="$HOME/.local/share/gem/ruby/3.3.4"
      export GEM_PATH="$HOME/.local/share/gem/ruby/3.3.4"
      export PATH="$HOME/go/bin:$PATH"
      export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
    '';
  };

  alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Hack Nerd Font Mono";
          style = "Regular";
        };
        size = 20;
      };
      keyboard = {
	bindings = [
	  {
	    key = "T";
	    mods = "Command";
	    chars = "\\u0002c";
	  }
	  {
	    key = "W";
	    mods = "Command";
	    chars = "\\u0002&";
	  }
	  {
	    key = "D";
	    mods = "Command";
	    chars = "\\u0002%";
	  }
	  {
	    key = "D";
	    mods = "Command|Shift";
	    chars = "\\u0002\"";
	  }
	  {
	    key = "Key1";
	    mods = "Command";
	    chars = "\\u00021";
	  }
	  {
	    key = "Key2";
	    mods = "Command";
	    chars = "\\u00022";
	  }
	  {
	    key = "Key3";
	    mods = "Command";
	    chars = "\\u00023";
	  }
	  {
	    key = "Key4";
	    mods = "Command";
	    chars = "\\u00024";
	  }
	  {
	    key = "Key5";
	    mods = "Command";
	    chars = "\\u00025";
	  }
	  {
	    key = "Key6";
	    mods = "Command";
	    chars = "\\u00026";
	  }
	  {
	    key = "Key7";
	    mods = "Command";
	    chars = "\\u00027";
	  }
	  {
	    key = "Key8";
	    mods = "Command";
	    chars = "\\u00028";
	  }
	  {
	    key = "Key9";
	    mods = "Command";
	    chars = "\\u00029";
	  }
	  {
	    key = "H";
	    mods = "Control";
	    chars = "\\u0002h";
	  }
	  {
	    key = "J";
	    mods = "Control";
	    chars = "\\u0002j";
	  }
	  {
	    key = "K";
	    mods = "Control";
	    chars = "\\u0002k";
	  }
	  {
	    key = "L";
	    mods = "Control";
	    chars = "\\u0002l";
	  }
	  {
	    key = "Tab";
	    mods = "Control";
	    chars = "\\u0002n";
	  }
	  {
	    key = "Tab";
	    mods = "Control|Shift";
	    chars = "\\u0002p";
	  }
	];
      };
      colors = {
	primary = {
	  background = "#1e1e2e";
	  foreground = "#cdd6f4";
	  dim_foreground = "#7f849c";
	  bright_foreground = "#cdd6f4";
	};
	cursor = {
	  text = "#1e1e2e";
	  cursor = "#f5e0dc";
	};
	vi_mode_cursor = {
	  text = "#1e1e2e";
	  cursor = "#b4befe";
	};
	search = {
	  matches = {
	    foreground = "#1e1e2e";
	    background = "#a6adc8";
	  };
	  focused_match = {
	    foreground = "#1e1e2e";
	    background = "#a6e3a1";
	  };
	};
	footer_bar = {
	  foreground = "#1e1e2e";
	  background = "#a6adc8";
	};
	hints = {
	  start = {
	    foreground = "#1e1e2e";
	    background = "#f9e2af";
	  };
	  end = {
	    foreground = "#1e1e2e";
	    background = "#a6adc8";
	  };
	};
	selection = {
	  text = "#1e1e2e";
	  background = "#f5e0dc";
	};
	normal = {
	  black = "#45475a";
	  red = "#f38ba8";
	  green = "#a6e3a1";
	  yellow = "#f9e2af";
	  blue = "#89b4fa";
	  magenta = "#f5c2e7";
	  cyan = "#94e2d5";
	  white = "#bac2de";
	};
	bright = {
	  black = "#585b70";
	  red = "#f38ba8";
	  green = "#a6e3a1";
	  yellow = "#f9e2af";
	  blue = "#89b4fa";
	  magenta = "#f5c2e7";
	  cyan = "#94e2d5";
	  white = "#a6adc8";
	};
	dim = {
	  black = "#45475a";
	  red = "#f38ba8";
	  green = "#a6e3a1";
	  yellow = "#f9e2af";
	  blue = "#89b4fa";
	  magenta = "#f5c2e7";
	  cyan = "#94e2d5";
	  white = "#bac2de";
	};
	indexed_colors = [
	  { index = 16; color = "#fab387"; }
	  { index = 17; color = "#f5e0dc"; }
	];
      };
    };
  };

  tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      # vim-tmux-navigator
      sensible
      # yank
      {
        plugin = power-theme;
        extraConfig = ''
	    set -g @tmux_power_theme '#8FAEF9'
	    set -g default-terminal "tmux-256color"
	    set -ag terminal-overrides ",$TERM:RGB"
        '';
      }
    ];
    baseIndex = 1;
    mouse = true;
    historyLimit = 50000;
    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };

  git = {
    enable = true;
    userName = "Jimmy Ding";
    userEmail = "jimmyguding@gmail.com";
    lfs = {
      enable = true;
    };
    extraConfig = {
      pull.rebase = true;
      rebase.autoStash = true;
      rebase.autosquash = true;
      rerere.enabled = true;
      init.defaultBranch = "main";
    };
  };

  neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
    # settings = {
      # keymap_mode = "vim";
      # enter_accept = true;
    # };
  };
}
