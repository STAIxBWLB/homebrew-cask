cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.19"
  sha256 arm:   "1678dbf594a9f468480570d6a0a401e908809453b55e421887dad5d2c7f5f9c8",
         intel: "c46f26a2afe46c32fbee3433a60a991bb1ce455749169733ac313a47a8ef8d10"

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
