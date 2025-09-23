#!/bin/bash
# Re-writen on sep 22, '25

noinpt="No input, skipping"

blk_prompt() {
  local prompt_msg=$1
  local end_var=$2
  echo "$prompt_msg"
  read -r -p "(y/n): " input
  case "$input" in
    "y") eval "$end_var='y'" ;;
    "n") eval "$end_var='n'" ;;
    *) echo "$noinpt"; eval "$end_var=''" ;;
  esac
}

blk_action() {
  local choice=$1 # upSys, etc
  local actionP=$2 # Yes action
  local actionN=$3 # No actioin
  case "$choice" in # read upSys var for yes or no
    "y") eval "$actionP" ;;
    "n") eval "$actionN" ;;
    *) echo "$noinput" ;;
  esac
}

prefs_list() {
  blk_prompt "Do you want to update the system?" upSys
  blk_prompt "Do you want to install deps?" inDeps
  blk_prompt "Do you want to also install Docker?" inDocker
}

update_system() {
  if [ $upSys = "y" ]; then
    blk_prompt "Continue with update?" upSys
    blk_action "$upSys" "sudo xbps-install -Syu" "Skipping system update..." && \
    echo "---> Updated system!"
  else
    echo "Skipped!"
  fi
}

dep_install() {
  blk_prompt "Do you want to continue installing deps?" inDeps
  blk_action "$inDeps" "sudo xbps-install -Syu i3 conky polybar emptty helix kitty nitrogen dmenu libatomic x11vnc lynx" "Skipping dep install..." && \
  echo "---> Installed deps!"
}

docker_install() {
  blk_prompt "Do you want to continue install docker?" inDocker
  blk_action "$inDocker" "sudo xbps-install docker" "Skipping docker install..."
  blk_action "$inDocker" "sudo ln -s /etc/sv/docker /var/service/"
  echo "---> Installed Docker!"
}

# Function calls
prefs_list
update_system
dep_install
docker_install

echo "---> Installation completed!"
