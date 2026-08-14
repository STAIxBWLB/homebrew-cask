cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.50"
  sha256 arm:   "8e5b1d33a5c068a51823d2ceb312525cb40e246cb3cf90ebbc89003fe6b2a324",
         intel: "3df8d090faf6e5766f92ed56159152b45614172ca41b97fcc3155a572221e362"

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
