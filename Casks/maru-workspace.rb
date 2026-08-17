cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.54"
  sha256 arm:   "4d4484597acc3a17e990339cf95c86a2bef22dfb63e871d54080f824da09162f",
         intel: "6c14c20ba3c42b9c3d573d531d1f17bf9baf10954503dbf4d71e0c6e6993c1c8"

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
