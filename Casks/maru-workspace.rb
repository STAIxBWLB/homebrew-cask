cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.18"
  sha256 arm:   "fb6543d01dfb4c81dc7ea507fe9a7d24a2eccf7c9b6ec35017b6ec90173ba4a6",
         intel: "36d7757b3f0ed5bf0aefd7513ccb1e9518f2eef0f7118f134d6e29102cc22436"

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
