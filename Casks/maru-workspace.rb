cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.37"
  sha256 arm:   "d96eaf96854814819c8e4fadca6df5c9e30c498acbbad92b2197ef0aa3f116e5",
         intel: "701894371495c9f840700478351951d999a7a1cffd0bfe5da2ae13715601bccb"

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
