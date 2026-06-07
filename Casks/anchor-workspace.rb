cask "anchor-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.34"
  sha256 arm: "18783b96b9a50f5b8415a04d0f75acec6f9721c2867e493b0303d5b47ab228cf",
         intel: "cda35215bbafa4fb71f4f3cdf6071ac1f9013aff0be38a093bd68a89d47adae9"

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
