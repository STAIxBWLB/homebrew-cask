cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.31"
  sha256 arm:   "e5d1e4e29bfe41247a2b10e9f726e5b91fd08a6cb74d682cd6114deb3764ca58",
         intel: "9b06557314c510735fe5c3fa42c503ddca06f601efeb80e2170a63625ca20f0b"

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
