cask "anchor" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.15"
  sha256 arm: "48b5d41ac9e796ec78bc71703ab317f0ef4e339963d674eaad9da05351ab605d",
         intel: "d00a60d06df23bd5854c26fc3a1a90041ed4ac407aa515e561c63ec34361271e"

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
