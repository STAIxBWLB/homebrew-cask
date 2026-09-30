cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.15"
  sha256 arm:   "bcf31532507698e4c1674026b0d162349f007ccdf47d1bbb978e0456328050ef",
         intel: "876a8734952f8a4f0ab1837bb91075d2c55d8efb518105d66b815bf64056527f"

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
