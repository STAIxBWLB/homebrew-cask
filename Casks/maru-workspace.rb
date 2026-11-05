cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.25"
  sha256 arm:   "7d33f3cd1055b94eb1e2d2ec34975ff6aa08b230a3a6a163f902ccd9985df9cc",
         intel: "0adc1ee12f85cd5b86ea876139b8a321a7d5aaea15868bbfdc73312b0f71f492"

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
