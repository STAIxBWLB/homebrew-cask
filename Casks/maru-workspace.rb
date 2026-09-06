cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.4"
  sha256 arm:   "0b4447a6270a80e7cb87cd8057b9049b62e2fb75589284e9ebf4d7f1b8836335",
         intel: "70de1b95637d533a36efb0ded2642a7071297ef1451764b89513497c7e5a7fa0"

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
