cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.29"
  sha256 arm:   "faa7541dc7362c12a006a174bc1b3c84c993fd0da95c8a0f636849253882df8f",
         intel: "2bb4b88c6093925f5676f9b2dc4a125221ede11c5b6cb10ac416e606722b82b3"

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
