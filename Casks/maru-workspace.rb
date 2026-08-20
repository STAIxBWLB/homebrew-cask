cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.57"
  sha256 arm:   "9edd527217ec0bbca48b2682f3bf7df37e1032bac94fc2bcdfc2d93bd34faace",
         intel: "6764c6482fda2044dae8cba00b47f465043b8012ec15b063803ea5b84eb64d7f"

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
