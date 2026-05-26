cask "anchor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.17"
  sha256 arm: "7df8f26a09b6597bc210f94b33a1310e8182674be9f0ca40bffb9dc0f8e14de0",
         intel: "9ec360482125c317440c7b002295de41288a3c95ee6d2c81ae805a30db170505"

  url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/Anchor_#{version}_darwin_#{arch}_dmg.dmg",
      verified: "github.com/STAIxBWLB/anchor/"
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
