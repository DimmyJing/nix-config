{ pkgs, ... }:

let
  update = pkgs.writeShellScriptBin "update" ''
    sudo yabai --load-sa
    git -C /Users/jimmy/Workspace/nix add /Users/jimmy/Workspace/nix
    darwin-rebuild switch --flake /Users/jimmy/Workspace/nix
    sudo yabai --load-sa
  '';
in with pkgs; [
  alacritty
  jq
  yq
  ripgrep
  tmux
  go
  (postgresql_16.withPackages ( p: with p; [ pgvector ]))
  bun
  golangci-lint
  docker
  fira-code
  cloudflared
  ko
  tailscale
  kubectl
  k9s
  opentofu
  kubernetes-helm
  colima
  supabase-cli
  p7zip
  gh
  elixir
  imagemagick
  gleam
  erlang
  (ruby.withPackages ( p: with p; [
    rails
  ]))
  (python3.withPackages ( p: with p; [
    torch
    polars
    nltk
    pillow
    matplotlib
    deep-translator
    openai
    tqdm
    boto3
    psycopg2
    anthropic
    clickhouse-connect
    yt-dlp
    coverage
    pytest
    pytest-cov
  ]))
  turso-cli
  markdownlint-cli
  jdk21
  rustup
  swift-format
  gopls
  golangci-lint-langserver
  golangci-lint
  tree-sitter
  unixODBC
  ollama
  xray
  tailwindcss
  emscripten
  update
  clickhouse
  spotify-player
  btop
  duckdb
  unar
  ffmpeg
  just
  pyright
  glib
  doctl
  fluxcd
  natscli
  awscli
  # # General packages for development and system management
  # act
  # aspell
  # aspellDicts.en
  # bash-completion
  # bat
  # btop
  # coreutils
  # difftastic
  # du-dust
  # gcc
  # git-filter-repo
  # killall
  # neofetch
  # openssh
  # pandoc
  # sqlite
  # wget
  # zip

  # # Encryption and security tools
  # _1password
  # age
  # age-plugin-yubikey
  # gnupg
  # libfido2
  # pinentry
  # yubikey-manager

  # # Cloud-related tools and SDKs
  # # docker-compose
  # awscli2
  # flyctl
  # google-cloud-sdk
  # go
  # gopls
  # ngrok
  # ssm-session-manager-plugin
  # terraform
  # terraform-ls
  # tflint

  # # Media-related packages
  # emacs-all-the-icons-fonts
  # dejavu_fonts
  # fd
  # font-awesome
  # glow
  # hack-font
  # jpegoptim
  # noto-fonts
  # noto-fonts-emoji
  # pngquant

  # # PHP
  # php82
  # php82Packages.composer
  # php82Packages.php-cs-fixer
  # phpunit

  # # Node.js development tools
  fzf
  # nodePackages.live-server
  # nodePackages.nodemon
  # nodePackages.prettier
  nodePackages.npm
  nodejs

  ghc
  haskellPackages.haskell-language-server
  haskellPackages.cabal-install
  # haskellPackages.ghcup

  # # Source code management, Git, GitHub tools
  # gh

  # # Text and terminal utilities
  # htop
  # hunspell
  # iftop
  # jetbrains-mono
  # jq
  # ripgrep
  # slack
  # tree
  # unrar
  # unzip
  # zsh-powerlevel10k

  # # Python packages
  # black
  # python39
  # python39Packages.virtualenv
]
