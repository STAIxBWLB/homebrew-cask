cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.32"
  sha256 arm:   "6818afe61bf2ad5caaec326b926ac515651d143394832e6848d120206f3d24c7",
         intel: "bdb9929d93b29fc36492dc7db2aa9823a063828c1c646877c8186da1cc4e3f26"

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
