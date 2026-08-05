cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.45"
  sha256 arm:   "5d86c858dc7682814201dc83a7993390704de0133c2052eb9b78871a26ce5dd2",
         intel: "bb106ca2f284cecc24b76c638c5b0ed62192a7999f605659f4566d4195fb76e2"

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
