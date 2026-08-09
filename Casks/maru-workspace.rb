cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.48"
  sha256 arm:   "db2143945d7759ab675caea04456e8d7d2b5e1a908e7b77430d450b6161c12d5",
         intel: "7c51b2fa3f8fb6d67288dc6f94a59da431f377aef3e09aac2e6dd10d91e19bce"

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
