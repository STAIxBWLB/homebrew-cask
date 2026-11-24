cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.33"
  sha256 arm:   "6d87bc2fe044ca3321dd64782ba2f29d80a166c2ae6359ba6bd3e07c6fea15fd",
         intel: "fa9188e871a800c770aa5d4d46aa46e5e27765c764769184a9525802678c3928"

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
