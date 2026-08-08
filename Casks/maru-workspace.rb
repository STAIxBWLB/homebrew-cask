cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.46"
  sha256 arm:   "5d2d4b0bd3f15b5b7c97c50d2352f3f7cd158d5c5c1b3c2b871fb9b42f2d20ec",
         intel: "ea84a0d8f5cf98e54ca7f890a7550b4652482c1d4014e25a3561ae6361c3b592"

  url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/Maru_#{version}_darwin_#{arch}_dmg.dmg"
  name "Maru"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/maru"

  depends_on :macos

  app "Maru.app"

  zap trash: [
    "~/Library/Application Support/kr.maru.desktop",
    "~/Library/Caches/kr.maru.desktop",
    "~/Library/Preferences/kr.maru.desktop.plist",
  ]
end
