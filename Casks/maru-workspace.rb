cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.38"
  sha256 arm:   "d448f90143adb1dcc31aadba464282a5b1b24e69fa19868b1cba305a0921064e",
         intel: "948b16f84449da1738b49602e40b1bb3976bad2ccd87d2e98739d850e2567057"

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
