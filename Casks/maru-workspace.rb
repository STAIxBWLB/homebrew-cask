cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.64"
  sha256 arm:   "599a9c71608de5c53bd94077b6d596cda4b962b192d00bc159061e97bfc97ca2",
         intel: "17305e233a443d6469ed266ddb544593724a7d7003fe03d5f945a90cc3249eb9"

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
