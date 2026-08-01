cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.34"
  sha256 arm:   "c968d05b9b91f1efced6c27b40fe94bc791f4c456190b12a2aff66fc7e5d059c",
         intel: "1c1fa3aa5bbe17672acc46e0fb2624829436bf036c47a3193180fe0b4555c9dc"

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
