# homebrew-cask

Homebrew tap for [Maru](https://github.com/STAIxBWLB/maru) — a local-first AI workspace desktop app and CLI (구 Anchor, renamed 2026-07).

## Install

```bash
brew tap staixbwlb/cask
brew install --cask maru-workspace # desktop app → /Applications/Maru.app
brew install maru-cli              # CLI → /opt/homebrew/bin/maru (or /usr/local/bin on Intel)
```

## Upgrade

```bash
brew update
brew upgrade --cask maru-workspace
brew upgrade maru-cli
```

## Signing & notarization

Maru bundles are **Developer ID signed and notarized** (since v0.3.0). The cask's `postflight` strips `com.apple.quarantine` after install as belt-and-braces, so brew users launch the app directly with no Gatekeeper prompt. Users who download `.dmg` files manually from the [releases page](https://github.com/STAIxBWLB/maru/releases) get standard notarized-app behavior.

## Maintenance

This tap is auto-updated by the `homebrew-tap` job in [`STAIxBWLB/maru/.github/workflows/release-bundles.yml`](https://github.com/STAIxBWLB/maru/blob/main/.github/workflows/release-bundles.yml) on every published release. The renderer that fills in version + sha256 placeholders lives at [`scripts/update-homebrew-tap.mjs`](https://github.com/STAIxBWLB/maru/blob/main/scripts/update-homebrew-tap.mjs). To re-render locally:

```bash
cd path/to/maru
node scripts/update-homebrew-tap.mjs v<version> path/to/homebrew-cask
```
