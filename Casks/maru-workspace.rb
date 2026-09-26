cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.12"
  sha256 arm:   "2422fd206fa81f4a97e66296b10db2c664528092aa9896af897533576a3ce038",
         intel: "21d30cbc1272aefb374a61d704f03880fe0d32c5d5af1c085529866b4ad6cf43"

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
