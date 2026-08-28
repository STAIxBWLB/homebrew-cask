cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "d6bbd74361a87e30b9551ad405be7355b5f6aacefbd70783e649d26429e3a6fc",
         intel: "5e2ed2faffd8c78ab337f7b1c7d4a3ef9a159fcf3119ba9cd2a0e4327e32aa19"

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
