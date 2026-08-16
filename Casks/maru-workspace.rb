cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.52"
  sha256 arm:   "d571cc73b596c5031645fc428e1ef3ca3f637dfc45d2f11bfdbe850b1d2a9e47",
         intel: "100baa905907e4835a0a8b6a6090a66e5f8fd58b18220cb8a0bb15c51f50ac35"

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
