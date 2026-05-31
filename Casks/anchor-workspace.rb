cask "anchor-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.24"
  sha256 arm: "b0bfd54f605abed09bb0fa5fc3e5c2cbe9d89e70e5232f5d2d7981180b75d0ca",
         intel: "a0e784c3f55b968cd5169a1fb42126eaca9cc59044b7a8e0b6cde95773a705ab"

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
