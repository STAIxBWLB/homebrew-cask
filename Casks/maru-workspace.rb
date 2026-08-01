cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.35"
  sha256 arm:   "354f1b43db0d554195c5eb40b7940d71e038c48258889408d09fc45a46b8fad7",
         intel: "2d0d563e9fe46b268e0bcb3c772746c6c68d4e7c80a6719380aabfb9529f7362"

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
