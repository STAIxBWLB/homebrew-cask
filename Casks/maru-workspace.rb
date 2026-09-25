cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.11"
  sha256 arm:   "09b2e69f1e29ed9e8d5a743718256fc6ea8aae1f5316eec28b5d3e9f07d3ba99",
         intel: "0d1b8eaf41aba38349bf107da07315dcb2b5cedde70a2ce53399bb8e7cb780f5"

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
