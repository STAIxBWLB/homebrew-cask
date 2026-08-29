cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "03d3913dedd27c64e1fbc7fcd657e70a43c11bb269937e270018c3f588e892ea",
         intel: "420ef05dd88b8dd123974c3c32d30f46e47a33daff0b409c98091c15f5d56f3e"

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
