# homebrew-cask

Homebrew tap for [Anchor](https://github.com/STAIxBWLB/anchor) — a local-first AI workspace desktop app and CLI.

## Install

```sh
brew tap staixbwlb/cask

brew install --cask anchor-workspace # desktop app → /Applications/Anchor.app
brew install anchor-cli              # CLI → /opt/homebrew/bin/anchor (or /usr/local/bin on Intel)
```

Supports both Apple Silicon (`aarch64`) and Intel (`x86_64`) Macs.

## Upgrade

```sh
brew update
brew upgrade --cask anchor-workspace
brew upgrade anchor-cli
```

## Notarization

Anchor bundles are **Developer ID signed but not currently notarized** (we hit a stall in Apple's notary service for our bundle layout — see [anchor#28](https://github.com/STAIxBWLB/anchor/pull/28) for context).

The cask's `postflight` strips `com.apple.quarantine` after install, so **brew users launch the app directly with no Gatekeeper prompt**. Users who download `.dmg` files manually from the [releases page](https://github.com/STAIxBWLB/anchor/releases) will need to approve once via **System Settings → Privacy & Security → Open Anyway**.

## Tap maintenance

This tap is auto-updated by the `homebrew-tap` job in [`STAIxBWLB/anchor/.github/workflows/release-bundles.yml`](https://github.com/STAIxBWLB/anchor/blob/main/.github/workflows/release-bundles.yml) on every published release. The renderer that fills in version + sha256 placeholders lives at [`scripts/update-homebrew-tap.mjs`](https://github.com/STAIxBWLB/anchor/blob/main/scripts/update-homebrew-tap.mjs). To re-render locally:

```sh
cd path/to/anchor
make homebrew-update HOMEBREW_TAP_DIR=path/to/homebrew-cask RELEASE_TAG=vX.Y.Z
```
