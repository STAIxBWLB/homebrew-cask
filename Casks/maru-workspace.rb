cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.40"
  sha256 arm:   "d58cec843be36d0cc5f9e71c51d3d14ead102655f48995fb756277ce4d93dfcf",
         intel: "9db3c005b2318cda8352a4822c93ebd106ce6548eb1aa094c3220632d55e7e3e"

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
