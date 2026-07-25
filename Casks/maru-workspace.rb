cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.21"
  sha256 arm: "4234b2becd4021cc4768afe3742eb7cca3b2eae0dbdb2f60b71019f2854dfb2d",
         intel: "495414ed675d87a6e0b1dfe30c5ed896eafbb3c2d978e4e0d5fe1f652ea8f7bd"

  url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/Maru_#{version}_darwin_#{arch}_dmg.dmg"
  name "Maru"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/maru"

  # Bundles are Developer ID signed but not currently notarized. The
  # postflight strips com.apple.quarantine so brew users open the app
  # directly instead of seeing the Gatekeeper prompt that direct .dmg
  # downloaders see.
  app "Maru.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Maru.app"]
  end

  zap trash: [
    "~/Library/Application Support/kr.maru.desktop",
    "~/Library/Caches/kr.maru.desktop",
    "~/Library/Preferences/kr.maru.desktop.plist",
  ]
end
