# homebrew-cask

Homebrew tap for [Maru](https://github.com/STAIxBWLB/maru) — a local-first AI workspace desktop app and CLI (구 Anchor, renamed 2026-07).

## Install

```bash
brew install --cask staixbwlb/cask/maru-workspace # desktop app → /Applications/Maru.app
brew install staixbwlb/cask/maru-cli              # CLI → /opt/homebrew/bin/maru (or /usr/local/bin on Intel)
brew install staixbwlb/cask/dotfiles              # dot CLI
```

Homebrew 6.0+ loads only [trusted taps](https://docs.brew.sh/Tap-Trust). Installing by the full `staixbwlb/cask/<name>` taps the repository and trusts that item, so later commands can use the short name. If an existing install fails with `Refusing to load ... from untrusted tap`, trust the item once:

```bash
brew trust --cask staixbwlb/cask/maru-workspace
brew trust --formula staixbwlb/cask/maru-cli
brew trust --formula staixbwlb/cask/dotfiles
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

Release bots never push to `main`. They push a `publish/<name>-<version>` branch; the [`brew audit`](.github/workflows/audit.yml) workflow audits that commit and, only if the audit passes, opens a PR and merges it. `main` requires a PR with a passing `audit` check.

This tap is auto-updated by the `homebrew-tap` job in [`STAIxBWLB/maru/.github/workflows/release-bundles.yml`](https://github.com/STAIxBWLB/maru/blob/main/.github/workflows/release-bundles.yml) on every published release. The renderer that fills in version + sha256 placeholders lives at [`scripts/update-homebrew-tap.mjs`](https://github.com/STAIxBWLB/maru/blob/main/scripts/update-homebrew-tap.mjs). To re-render locally:

```bash
cd path/to/maru
node scripts/update-homebrew-tap.mjs v<version> path/to/homebrew-cask
```
