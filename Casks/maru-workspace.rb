cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.23"
  sha256 arm:   "16f365ee6ff150fa43d7eddb1069d84a220602dfa0dd6e36e1fa97838eb35379",
         intel: "bb61d600986e79405101ef321e003e9e76f689cc6a1c76ea8ce0a60563f51c08"

  url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/Maru_#{version}_darwin_#{arch}_dmg.dmg"
  name "Maru"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/maru"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Maru.app"

  zap trash: [
    "~/Library/Application Support/kr.maru.desktop",
    "~/Library/Caches/kr.maru.desktop",
    "~/Library/Preferences/kr.maru.desktop.plist",
  ]
end
