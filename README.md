# Dapphub's Nixpkgs channel

This directory can act as a root `<nixpkgs>`.  We use a submodule to
pin a specific version of the upstream, and our `default.nix` loads
that, configured with our overlay.

You can also use the `overlay` directory as an overlay on whatever
version of nixpkgs you wish.

## Keeping in sync

The version at which the packages in this repo are pinned at is updated via the
`bump` bash script.

When run, this script scans the repository of each of the DappHub packages and
updates the version in this overlay.
