cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.56"
  sha256 arm:   "7e98a5562d28d1281508aaa09202aee7a64b9ed61367042e72b2c6b35b881697",
         intel: "a1b99240e797b4dcba13887a0149c13e9d7ce37e06b68769dfd57294b8000b30"

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
