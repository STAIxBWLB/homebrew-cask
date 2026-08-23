cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.63"
  sha256 arm:   "f7c3703e94cf0123d9cc20f1cd777232bca2f52d6293040906b49bbbbe183c78",
         intel: "11d435d543825f392c5e76d977dbd77e677f46d6fc391e6f830fa9cd0964a665"

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
