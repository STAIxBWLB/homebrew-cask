cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.2"
  sha256 arm:   "602b3f47ada23bb3d4ad5150feb7dc34166dd3140017bdb04e0f30272eb15abc",
         intel: "7b1e2484db886f4c2016e79f9c2deb20388260e1cba0964df6cb566fb7157e5c"

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
