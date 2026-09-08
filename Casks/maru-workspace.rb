cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.5"
  sha256 arm:   "1b8e680eb184427fbfb4679b28253c3207f65b800f30e5bc015ec8e432ceb4d5",
         intel: "7bd2cbff7a9be184fb34bb644704bb87172ba8ff9b25d1f68417589e330ffbc3"

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
