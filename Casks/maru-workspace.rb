cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.42"
  sha256 arm:   "71bf48fb2f9bda875c7bc09b57c4abb64a9621dc4d4085c70741859a8abe3c39",
         intel: "bdca33e62de1529b80259e40c297c37956a638701b0e8075893859f740a45f44"

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
