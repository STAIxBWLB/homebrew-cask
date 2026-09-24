cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.8"
  sha256 arm:   "480b0c28a68d8602eebea441334ef5b5f73645e5c812f645a4fba3114e7362a2",
         intel: "3de3d5cea8c30cd4e0e971c421d025ef774361912222b38473cb212e49910e92"

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
