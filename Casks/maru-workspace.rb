cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.33"
  sha256 arm:   "036fe5296e1738dd67530362cf088adb69ff901cf3389e39dc138ee7f372bc63",
         intel: "b7d98d23cb3ff87f8afd831d9c1b9197b3b4aa99aaa500f08ed85fb6bbc82dd1"

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
