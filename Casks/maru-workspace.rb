cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.7"
  sha256 arm: "73420b18968b260c7088496a313ada9e39c630b5efeec253c863a00bee244c5e",
         intel: "18071a1be7437e717db9eba5fcbf8158d90f1e905e95c475fc54549b1ee057bd"

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
