#!/bin/bash
# Written on Sep 8, '25
# Last update 09-09-25

noinpt="No input, skipping"

pref_list() {
  echo "Welcome! Please select your prefrences:"
  echo "Do you want to update the system?"
  read -r -p "y/n: " upSys
  case "$upSys" in
    y) echo "Makred to update" ;; # valid
    n) echo "Marked to skip" ;; # valid responce 
    *) echo "$noinpt"
  esac
  echo "Do you want to install deps?"
  read -r -p "y/n: " inDeps
  case "$inDeps" in
    y) echo "Marked for install" ;; # valid responce 
    n) echo "Marked for skipped" ;;
    *) echo "$noinpt" ;;
  esac

  read -r -p "Install docker also? (y/n): " inDepsDocker
  case "$inDepsDocker" in
    y) echo "Marked docker for install" ;; # valid responce 
    n) echo "Marked docker for skip" ;;
    *) echo "$noinpt" ;;
  esac
}

sys_update() {
  read -r -p "Cont? (with the sys update?) (y/n) " upCont
  case "$upCont" in
    y) sudo xbps-install -Syu ;;
    n) echo "Skipping" ;;
    *) echo "$noinpt" ;;
  esac
    }

install_dep() {
  read -r -p "Cont? (with dep inst?) (y/n) " depCont
  case "$depCont" in
    y) sudo xbps-install -Syu i3 conky polybar emptty helix kitty nitrogen dmenu libatomic x11vnc lynx ;;
    n) echo "Skipping dep install..." ;;
    *) echo "$noinpt" ;;
  esac
  }
  
install_dock() {
  case "$inDepsDocker" in
    y) echo "Installing docker..." && sudo xbps-install docker ;;
    n) echo "Skipping docker..." ;;
    *) echo "$noinpt" ;;
  esac
  }

# Main logic
pref_list
case "$upSys" in
  y) sys_update && echo "Update succesfull!";;
  n) echo "No update chosen" ;;
  *) echo "       ";;
esac

case "$inDeps" in
  y) install_dep && echo "Installed deps!";;
  n) echo "No deps chosen" ;;
  *) echo "       "
esac

case "$inDepsDocker" in
  y) install_dock && echo "Installed docker!";;
  n) echo "No deps chosen" ;;
  *) echo "       "
esac
