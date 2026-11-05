cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.24"
  sha256 arm:   "ba22b77a0a29e011c562963d8c9c674671b0cb1ef2262d7b381a3e3a24625da5",
         intel: "92c0ae04fc87265ab3769849df6c44092a5f48053c30f7f8ada694f3776ed405"

  url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/Maru_#{version}_darwin_#{arch}_dmg.dmg"
  name "Maru"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/maru"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Maru.app"

  zap trash: [
    "~/Library/Application Support/kr.maru.desktop",
    "~/Library/Caches/kr.maru.desktop",
    "~/Library/Preferences/kr.maru.desktop.plist",
  ]
end
