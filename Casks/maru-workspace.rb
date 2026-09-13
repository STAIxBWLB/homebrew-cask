cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.6"
  sha256 arm:   "98f660586cfff4746c74b58e848483bee542d67beeef1a368fcffc2ea1f43318",
         intel: "86697fdc22166e68839805325e10432e324cc151ceb6b7444dcf23bb8670b36f"

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
