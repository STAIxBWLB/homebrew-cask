cask "anchor-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.22"
  sha256 arm: "f5736cc7dda079f8a0ea20dbf4669438d0ea6c1272d444d037a3ada28a6eff2b",
         intel: "f93b2942cedfdcf4282a29c23ae1f371e05129dc39847c8d17c7203f3deea1a9"

  url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/Anchor_#{version}_darwin_#{arch}_dmg.dmg"
  name "Anchor"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/anchor"

  # Bundles are Developer ID signed but not currently notarized. The
  # postflight strips com.apple.quarantine so brew users open the app
  # directly instead of seeing the Gatekeeper prompt that direct .dmg
  # downloaders see.
  app "Anchor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Anchor.app"]
  end

  zap trash: [
    "~/Library/Application Support/kr.anchor.desktop",
    "~/Library/Caches/kr.anchor.desktop",
    "~/Library/Preferences/kr.anchor.desktop.plist",
  ]
end
