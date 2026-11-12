cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.27"
  sha256 arm:   "867305da6ffd7cb82684c6d2ec25a5e4dd0c6de99358b1f80caf81465fa64067",
         intel: "d597c9486126351289b8969144b3b7b3858bc3caa08a20469ac982d9350882f9"

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
