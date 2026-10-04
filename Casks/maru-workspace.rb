cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.16"
  sha256 arm:   "5356a64c182234a971041c046298c5e2878be408c87c2fbd52cf6678ea0a78fc",
         intel: "e519cb59422f2a2b15f4b6d15c9a0327807e55db092eff1ad42fd59b29659abc"

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
