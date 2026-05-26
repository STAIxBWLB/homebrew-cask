cask "anchor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.16"
  sha256 arm: "2c009427fc91e9a94e6f47abb505d6ee05fd781808af0ae5c6a68ac936309210",
         intel: "c35c0adce9df11f86d9a4d9010013c6bc6257afb056510aa0fe1910d56143a70"

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
