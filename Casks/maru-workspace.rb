cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.5"
  sha256 arm: "6e782ff8388822d14c3e6207abf58ee7c3694abe59802b92a9be9bfff120bc1f",
         intel: "00873e5f53fc30c770c0b012c5a695a35db8632e8f4b9d5e06ae3847e2967d72"

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
