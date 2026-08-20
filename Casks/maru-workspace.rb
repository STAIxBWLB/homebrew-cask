cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.59"
  sha256 arm:   "2f7692e7d9ea9decce45fb7a0f2089dacd536724317983e335037278ca166c44",
         intel: "feb0a6200332f18d9309b4d71c6bb39e2fcebe4e7e6351ae976bb3b2b0152911"

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
