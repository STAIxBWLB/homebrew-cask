cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.32"
  sha256 arm:   "f2cb3e36f8c29aa78d92156d065449619e6e72a6e3664c775883ba02c0ea94a8",
         intel: "6676216050da145b4a0df09ad7c2f649f03ff83f4c46dd36a1c1d9c5d9d9505f"

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
