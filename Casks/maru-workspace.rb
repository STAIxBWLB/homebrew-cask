cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.36"
  sha256 arm:   "ca95090a97c1ee6038c49c9167a4a2ec3a1f7f9b604b50331b48b9e852aa871a",
         intel: "1535b197be9338a166d2cdd0fbd711fea967be8ee580094859b39e4c2292d6d0"

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
