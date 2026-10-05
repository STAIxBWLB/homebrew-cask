cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.17"
  sha256 arm:   "89d73f28f957638c93a3b6c2837818eefa0127fc2914eb0d36e772e9a45249c4",
         intel: "c5a9677eb4d98d030d63a7baf42c7effb9a8bff4bd521459d22b9b238c7d2daf"

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
