cask "anchor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.14"
  sha256 arm: "7a795007c97c378c79ce95996b31940d6c306d347fd45d42f30e2974ca473d12",
         intel: "d57a402660d7db2cc2639eb52511da3c5f8c816cb7340e6e4f07592f5e66ff90"

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
