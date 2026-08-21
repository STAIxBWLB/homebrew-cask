cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.61"
  sha256 arm:   "16240d7e186854b07d05806f5018a26175b613a198cfc317c2b1d34f0a4d4bcd",
         intel: "14c6aff29a8fc163e83b28a1c26b07233b725e74f0ddd63fee6fd69cfb2a7667"

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
