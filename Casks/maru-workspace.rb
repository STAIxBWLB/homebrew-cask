cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.30"
  sha256 arm:   "865435c90fa87f9b3d25d043661d4c641944957fe685eca108421649d2eb83af",
         intel: "a763d2e2bd134f51d0ed77419d512744bcdd2e00fe970e8e0b6f0fef5daa6733"

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
