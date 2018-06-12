#!/bin/bash
# This script configures nix to use the DappHub binary cache when building packages.
# Requires nix >= 2.0.4.
set -ev

mkdir -p ~/.config/nix
cat <<EOF >> ~/.config/nix/nix.conf
binary-caches = https://cache.nixos.org https://d121dybo9yhl5h.cloudfront.net
trusted-binary-caches = https://cache.nixos.org https://d121dybo9yhl5h.cloudfront.net
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= d121dybo9yhl5h.cloudfront.net-1:IOpHdUBT2b3fIRb/TBm+V8Y8eEj52fStcllzD6TFYyU=
EOF


# Workaround until proper macOS support is added to cachix.
# See https://github.com/cachix/cachix/issues/26
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  echo "trusted-users = root $USER" | sudo tee -a /etc/nix/nix.conf

  sudo launchctl kickstart -k system/org.nixos.nix-daemon
fi
