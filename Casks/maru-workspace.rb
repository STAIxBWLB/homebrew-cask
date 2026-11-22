cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.31"
  sha256 arm:   "273f7fad5f13c4f2416056c15edbaab210d5d9cc2b70bfb718719a71ebc4c6e6",
         intel: "86f8557bd908383a0a18cadafa873b3919cffdeec431848428c90266788723f8"

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
