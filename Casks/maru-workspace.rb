cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.53"
  sha256 arm:   "0e0038b699e652dd16aa382fe7a888722f0b0a12967a9c342c030f1fd9fe6ca0",
         intel: "66d7f12a828da6a99f1d4537b73be008f4e19ed2af2ff2358ec95f0ccbd3db3d"

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
