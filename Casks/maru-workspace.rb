cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.43"
  sha256 arm:   "5a99057e69bbf581c308117ed57ed8f6927ad05d4d7e99b35783482c95e40a76",
         intel: "bf24481027bd70812267e3ecdd449b89bd73dbf56242795177107e2e288ad909"

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
