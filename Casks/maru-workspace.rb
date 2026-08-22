cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.62"
  sha256 arm:   "20baeda83f55e44a76234dc69ef5afcbe36aa1899f3c18dd33f336f4e91d0aaf",
         intel: "05d89cc386cb3aac24f3e95a12cfb3d0b74866701d7601ba1d9d565959d4c05a"

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
