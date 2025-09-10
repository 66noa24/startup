#!/bin/bash
# Written on 2025-09-09 | En (6624)

# Variables
PATHhm="/home/$USER/.config/"
PATHxt="/etc/"
noinput="Error, not a valid option"
dirpath="$(pwd)"
## Functions ##
copy_pref() {
  echo "Choose which configs to copy over:"
  echo "Note, conky, polybar, and emptty require copyign to /etc/. I (The author), recommend you look at the script yourself before running"
  echo "1: i3"
  echo "2: Helix"
  echo "3: Polybar"
  echo "4: Conky"
  echo "5: Emptty"
  echo "6: All"
  read -r -p "(1, 2, 3, 4, 5, 6) " pkgInt
  }

i3_inst() {
  echo "Copying i3 configs"
  install -d "$dirpath/cnfgs/.config/i3/config $PATHhm/i3/config"
  echo "Copied i3!"
}

helix_inst() {
  echo "Copying helix configs"
  install -d "$dirpath/cnfgs/.config/helix/config.toml $PATHhm/helix/config.toml"
  echo "Copied helix!"
}

poly_inst() {
  echo "Copying polybar configs"
  sudo install -d "$dirpath/cnfgs/.etc/polybar/config.ini $PATHxt/polybar/config.ini"
  echo "Copied polybar!"
}

conky_inst() {
  echo "Coping conky configs"
  sudo install -d "$dirpath/cnfgs/.etc/conky/conky.conf $PATHxt/conky/conky.conf"
  echo "Copied conky!"
}

emptty_inst() {
  echo "Copying emptty configs"
  sudo install -d "$dirpath/cnfgs/.etc/emptty/conf $PATHxt/emptty/conf"
  echo "Copied emptty conf"
  read -r -p "also move over MOTD file? (y/n) " motdMV
  case "$motdMV" in
    y) sudo install "$dirpath/cnfgs/.etc/emptty/motd $PATHxt/emptty/motd"
    n) echo "Skipping"
    *) echo "Not valid input"
  esac
}

all_inst() {
  i3_inst
  helix_inst
  poly_inst
  conky_inst
  emptty_inst
}

## Main Logic ##

class "$pkgInt" in
    "1") i3_inst ;;
    "2") helix_inst ;;
    "3") poly_inst ;;
    "4") conky_inst ;;
    "5") emptty_inst ;;
    "6") all_inst ;;
    *) echo "$noinput" ;;
  esac
