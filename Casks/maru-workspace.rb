cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.28"
  sha256 arm:   "e9f366076b82a70e0734ebf639e00bac535a8d8a1d055b4435b83c76ed6d64d3",
         intel: "ad29492e5252c4d71e8b13e5621e5a33cc6cc48ef03b996d19f0a68d1d1e9ae5"

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
