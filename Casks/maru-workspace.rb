cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.49"
  sha256 arm:   "c5ada6884362429be7da4988f760500d697850d7aaca6bd9742dfe8557c6df91",
         intel: "722102320a171da4ad7c04fdf11023a906b77b89d4298d5549e305a6679b6078"

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
