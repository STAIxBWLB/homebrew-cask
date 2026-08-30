cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "0150dfd3f9b9a4ef82851e78e0aee2c248fa8fea0c289f2731a78647a1587d78",
         intel: "e9d4e30ef369de5e565341ced4d911c7bb4edb135f87ab8a2b2682dfcec015e4"

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
