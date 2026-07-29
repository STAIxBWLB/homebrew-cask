cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.30"
  sha256 arm:   "5f1757351faed59c9939cfbcdf844870ad43d4c2f3b1abba5474982e49966ba4",
         intel: "caafc0ef0d766f493dbdc9cd42d415b512f481124272a900f9cb901bc53489f2"

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
