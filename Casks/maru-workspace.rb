cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.51"
  sha256 arm:   "48e78fa70e9da2644ef6b1396bd9aa3cee42b3ee480822fc0b499ccd62948b07",
         intel: "96b9c5ba0f3cfe8940b35df4b3d740cee5f20220a50bc4c76afb1bf10b580beb"

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
