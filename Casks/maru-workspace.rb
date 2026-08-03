cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.41"
  sha256 arm:   "d84b053ffbe9e583c1ff2238243ca56937bf8cbda8adc92212ebfe0444d923df",
         intel: "5ed0440f1305959c02e68ba61613eab72ce1d4fd84a7b3f36233225a6115aea1"

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
