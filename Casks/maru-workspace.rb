cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.10"
  sha256 arm: "595512ec8fec83f07f52cbea740a8659e20cc3bb60ccb2443dea078f65817d65",
         intel: "14eaefa3fd10e6c548405985501931a558173bad00146ef97e60a61137a70d65"

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
