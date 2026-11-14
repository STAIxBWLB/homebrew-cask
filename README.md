# homebrew-cask

Homebrew tap for two STAIxBWLB projects:

| Name | Type | What it installs | Source |
|------|------|------------------|--------|
| `maru-workspace` | cask | Maru desktop app, `/Applications/Maru.app` (macOS) | [STAIxBWLB/maru](https://github.com/STAIxBWLB/maru) |
| `maru-cli` | formula | `maru` CLI | [STAIxBWLB/maru](https://github.com/STAIxBWLB/maru) |
| `dotfiles` | cask | `dot` CLI, also linked as `dotfiles` (macOS and Linuxbrew) | [STAIxBWLB/dotfiles](https://github.com/STAIxBWLB/dotfiles) |

Maru is a local-first AI workspace desktop app and CLI (formerly Anchor, renamed 2026-07). `dot` is a declarative dotfiles manager and AI tmux workspace orchestrator.

## Install

```bash
brew install --cask staixbwlb/cask/maru-workspace
brew install staixbwlb/cask/maru-cli
brew install --cask staixbwlb/cask/dotfiles
```

Homebrew 6.0+ loads only [trusted taps](https://docs.brew.sh/Tap-Trust). Installing by the full `staixbwlb/cask/<name>` taps the repository and trusts that item, so later commands can use the short name. If an existing install fails with `Refusing to load ... from untrusted tap`, trust the item once:

```bash
brew trust --cask staixbwlb/cask/maru-workspace
brew trust --formula staixbwlb/cask/maru-cli
brew trust --cask staixbwlb/cask/dotfiles
```

## Upgrade

```bash
brew update
brew upgrade --cask maru-workspace
brew upgrade maru-cli
brew upgrade --cask dotfiles
```

`dot update` also upgrades the `dotfiles` cask.

`dotfiles` was a formula until STAIxBWLB/dotfiles#344. `tap_migrations.json` moves an existing formula install to the cask on the next `brew update` (Homebrew unlinks the formula and installs the cask when the tap is trusted and the prefix has a `Caskroom`). Otherwise run `brew uninstall --formula --force dotfiles && brew install --cask staixbwlb/cask/dotfiles`.

## Signing and notarization

Maru bundles are Developer ID signed and notarized (since v0.3.0), so the app opens with no Gatekeeper prompt whether it comes from the cask or from a `.dmg` on the [Maru releases page](https://github.com/STAIxBWLB/maru/releases).

The `dot` binary is not notarized; the `dotfiles` cask strips `com.apple.quarantine` from it before linking.

## Maintenance

Release bots never push to `main`. Each pushes a `publish/<name>-<version>` branch, and the [`brew audit`](.github/workflows/audit.yml) workflow audits every cask and formula in the tap on that commit. Only if the audit passes does it open a PR and merge it. A publish branch may change only `Casks/` and `Formula/`; anything else lands through a normal reviewed PR. `main` requires a PR with a passing `audit` check. Review notes for changes to the workflow are in [REVIEW.md](REVIEW.md).

| Item | Updated by | Branch |
|------|------------|--------|
| `maru-workspace`, `maru-cli` | `homebrew-tap` job in [`STAIxBWLB/maru/.github/workflows/release-bundles.yml`](https://github.com/STAIxBWLB/maru/blob/main/.github/workflows/release-bundles.yml), on every published release | `publish/maru-<tag>` |
| `dotfiles` | GoReleaser `homebrew_casks` in [`STAIxBWLB/dotfiles/.goreleaser.yaml`](https://github.com/STAIxBWLB/dotfiles/blob/main/.goreleaser.yaml), on every release tag | `publish/dotfiles-<version>` |

Do not edit `Casks/dotfiles.rb` by hand. GoReleaser generates it, and `dot update` installs the verified prebuilt binary only when the tapped cask matches GoReleaser's output byte for byte; after a hand edit, `dot update --check` reports that the tap cask is not the canonical release cask and `dot update` leaves that path.

The Maru renderer that fills in version and sha256 placeholders is [`scripts/update-homebrew-tap.mjs`](https://github.com/STAIxBWLB/maru/blob/main/scripts/update-homebrew-tap.mjs). To re-render locally:

```bash
cd path/to/maru
node scripts/update-homebrew-tap.mjs v<version> path/to/homebrew-cask
```
