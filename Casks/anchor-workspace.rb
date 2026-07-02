cask "anchor-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.40"
  sha256 arm: "92fb911afe004b22df9ef2afccbd5235ebb4b7c1ed85d69ca2bd607140f6b2c6",
         intel: "1859ee4006357eecd9e9e142c71351d0c0ff39d3b61b2e84e728baafdc331c76"

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
