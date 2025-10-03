#!/usr/bin/env bash

detect_shell_rc() {
  local shell rc
  shell=$(basename "$SHELL")

  case "$shell" in
    bash) rc="$HOME/.bashrc" ;;
    zsh)  rc="$HOME/.zshrc" ;;
    ksh)  rc="$HOME/.kshrc" ;;
    *)
        echo "Error: unsupported shell '$shell'. Use manual installation!"
        exit 1
        ;;
  esac

  echo "$rc"
}

install_docker_config() {
    local rc
    rc=$(detect_shell_rc)

    mkdir -p "$HOME/.config/fzf"
    cp docker.conf "$HOME/.config/fzf/"

    echo 'source ~/.config/fzf/docker.conf' >> "$rc"
    
    echo "Installed docker.config and updated $rc"
}

install_docker_config