cask "anchor-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.23"
  sha256 arm: "427f84d90b5e8eae9d355dacd90c236be12c305d92018c72c5dcd70e9fbe4fba",
         intel: "22194dc32ba694a34d3f6d58bcd00bb0cc24c6f443072c8b0164bbd28d40e514"

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
