cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.14"
  sha256 arm:   "2d8247c105c52edd4d14819367c9c735e20cf86097ff07f860b4ad33bd808406",
         intel: "06c11b5bdd156183856ae1373963dbe504158f1df8b4816348aed0210c1f247d"

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
