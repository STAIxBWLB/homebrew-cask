cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.39"
  sha256 arm:   "36d3e241c484cd723910f491f75ac772ce168c3fd1accd4eed814583a8d37d58",
         intel: "45b5fc776d85172f92ee8459f51fa7761ba1be99efb17ad0d8eee2a5a2f071b0"

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
