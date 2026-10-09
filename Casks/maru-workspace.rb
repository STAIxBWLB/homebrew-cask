cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.21"
  sha256 arm:   "2d59793427e8f2930f6ef8691df9d7e77e665b684d94089939e2ecc75c1b4eb0",
         intel: "55e356a5bf810fbfe56072ad9d78d19213df0a2b911d59337f24bce8294a6761"

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
