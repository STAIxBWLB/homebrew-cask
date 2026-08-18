cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.55"
  sha256 arm:   "2543c02fb619fdf96f1a5cdd79a7f17217cfd95bff6b11b7620921de4d1fd6e0",
         intel: "56188da87054e25d85de00995c4fc07c3eb62254ced6638c5e9c818f1ff8ed64"

  url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/Maru_#{version}_darwin_#{arch}_dmg.dmg"
  name "Maru"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/maru"

  depends_on :macos

  app "Maru.app"

  zap trash: [
    "~/Library/Application Support/kr.maru.desktop",
    "~/Library/Caches/kr.maru.desktop",
    "~/Library/Preferences/kr.maru.desktop.plist",
  ]
end
