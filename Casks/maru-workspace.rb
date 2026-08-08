cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.47"
  sha256 arm:   "00784d2a1c6015684ff905680b0e7be43d9827b02df31f544bfe00f557289afe",
         intel: "2339445e7b8d1a364afcc4ad9caee8cb803ed0319561b1b6708de85afcb0cedf"

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
