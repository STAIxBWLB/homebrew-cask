cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.26"
  sha256 arm:   "7f4448457798091dddac1d805eab910de3687335a33de7cbbcbe511046f37a72",
         intel: "ff499e3ef93498ba6c9a967066bf394c9c0bae2d6f4d29f0be3fcfb035721a1a"

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
