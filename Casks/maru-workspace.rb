cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.20"
  sha256 arm:   "7c3563e68e0728611fe923920688f13487de567415445a6e274460fa0a431c2b",
         intel: "f7a976ca507e492b931c635fd38a8a11243866e527255fc1a781ed3ebd70627a"

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
