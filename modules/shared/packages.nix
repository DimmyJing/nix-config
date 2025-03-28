{ pkgs, ... }:

let
  update = pkgs.writeShellScriptBin "update" ''
    sudo yabai --load-sa
    git -C /Users/jimmy/Workspace/nix add /Users/jimmy/Workspace/nix
    darwin-rebuild switch --flake /Users/jimmy/Workspace/nix
    sudo yabai --load-sa
  '';
in with pkgs; [
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
  p7zip
  gh
  elixir
  imagemagick
  gleam
  erlang
  (python3.withPackages ( p: with p; [
  ]))
  turso-cli
  markdownlint-cli
  jdk21
  rustup
  gopls
  golangci-lint-langserver
  golangci-lint
  tree-sitter
  ollama
  xray
  tailwindcss
  update
  clickhouse
  spotify-player
  btop
  duckdb
  unar
  ffmpeg
  just
  pyright
  doctl
  fluxcd
  natscli
  awscli
  deno
  cue
  uv
  rclone
  esbuild
  typst
  wget
  fzf
  nodejs_23
  # ghc
  # haskellPackages.haskell-language-server
  # haskellPackages.cabal-install
]
