cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.44"
  sha256 arm:   "e786d45e4003cffc6b5ac4d32e2d08e088ad7dc0e06bcb189b6019a1b79b0f50",
         intel: "295c545ddf5cf51fb4ccba7433b15f57d7cc95d979f3a920ccd1082a379c04c8"

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
