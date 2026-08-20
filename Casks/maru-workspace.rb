cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.58"
  sha256 arm:   "57a0b0d0ea8adf5921422e3461ef928c0b0e20f6aa7a13939a0c2ea786a1e96f",
         intel: "dedb9109ab6d4af7fc49ed5f67c8c5873eae162ca2b9f9ed6b515352174bc6d5"

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
