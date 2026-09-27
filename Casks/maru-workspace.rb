cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.13"
  sha256 arm:   "1239d15b1c9e21f7284488156bb5a5738e8621a4dcf48a09003fdc42d10461af",
         intel: "14758be595178a6b11b445f8d39cf4c46ed07671dfb4bfae3754d1e9dae6be25"

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
