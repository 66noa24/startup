#!/bin/bash
# To be added?
# Ask if user is on bedrock install
# docker commands - (dynamic or fixed?)

dirpath="$(pwd)"

echo "!!! -> This scrupt ALSO uses docker to import strata"
echo "!!! -> Please run inital script and install docker if not already"
echo "-------------------------"

# FUNCTIONS
# Verify bedrock and docker are installed
bedrock_verify() {
  if ls / | grep -q bedrock; then
    echo "Bedrock is installed, you may continue"
    bedinst=true
  else
    echo "!! -> Please install bedrock before continuing..."
    exit
  fi
  # Bedrock install check var
  export bedisnt
}

docker_verify() {
  if find /var/service/ | grep -q docker; then
    echo "Docker is installed!"
    dockerinst=true
  else
    echo "!! -> Docker is not installed. Please isntall docker before continuing..."
    exit
  fi
  # docker install check vat
  export dockerinst
}

strata_prefs() {
  echo "Which stratum would you like installed? (1, 2, 3)"
  echo "1: Debian"
  echo "2: Arch"
  echo "3: Both"
  read -r -p "> " strataPref

  case "$strataPref" in
    "1") debstrat=true ;;
    "2") archstrat=true ;;
    "3") debstrat=true ; archstrat=true ;;
    *) echo "! -> Invalid Option" ;;
  esac
}

deb_strat_install() {
  if [ "$debstrat" = true ]; then
    echo "--> Pulling debian:trixie image from docker" && \
    sudo docker pull debian:trixie && \
    echo "--> Creating docker container for debian:trixie named deb-temp"
    sudo docker create --name deb-temp debian:trixie && \
    echo "--> Exporting filesystem from container to ./docker-tmp/deb-RFS.tar.gz"
    sudo docker export deb-temp | gzip -c > "$dirpath/docker-tmp/deb-RFS.tar.gz" && \
    echo "--> Importing stratum"
    sudo brl import debian "$dirpath/docker-tmp/deb-RFS.tar.gz" && \
    echo "--> Debian imported!"
  else
    echo "Skipping debian strata installation"
  fi
}

arch_strat_install() {
  if [ "$archstrat" = true ]; then
    echo "--> Pulling archlinux:latest image from docker" && \
    sudo docker pull archlinux:latest && \
    echo "--> Creating docker container for archlinux:latest named arch-temp"
    sudo docker create --name arch-temp archlinux:latest && \
    echo "--> Exporting filesystem from container to ./docker-tmp/arch-RFS.tar.gz"
    sudo docker export arch-temp | gzip -c > "$dirpath/docker-tmp/arch-RFS.tar.gz" && \
    echo "--> Importing stratum"
    sudo brl import arch "$dirpath/docker-tmp/arch-RFS.tar.gz" && \
    echo "--> Arch imported!"
  else
    echo "Skipping Arch strata installation"
  fi
}
  
# Main
bedrock_verify
docker_verify
strata_prefs
deb_strat_install
arch_strat_install
