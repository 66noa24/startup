#!/bin/bash
# Written on Sep 8, '25
# Last update 09-09-25

pref_list() {
  echo "Welcome! Please select your prefrences:"
  echo "Do you want to update the system?"
  read -r -p "y/n: " upSys
  echo "Do you want to install deps?"
  read -r -p "y/n: " inDeps
}

sys_update() {
  read -r -p "Cont? (with the sys update?) (y/n) " upCont
  case "$upCont" in
    y) sudo xbps-install -Syu ;;
    n) echo "Skipping" ;;
  esac
    }

install_dep() {
  read -r -p "Cont? (with dep inst?) (y/n) " depCont
  case "$depCont" in
    y) sudo xbps-install -Syu i3 conky polybar emptty helix kitty nitrogen dmenu libatomic x11vnc lynx ;;
    n) echo "Skipping" ;;
  esac
}

# Main logic
pref_list
case "$upSys" in
  y) sys_update ;;
  n) echo "No update chosen" ;;
esac

echo "Update succesfull!"
case "$inDeps" in
  y) install_dep ;;
  n) echo "No deps chosen" ;;
esac
echo "Installed deps!"
