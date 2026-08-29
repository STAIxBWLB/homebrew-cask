cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "8b24bc820c57cd51e45c4828c9ac1fd0e2277fbc578b96d0043bdff1fbbe735a",
         intel: "a947452462bb90868aacc1e6a563349ec4c97dbf279adcd1b1e2e9f3f57f1b0b"

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
