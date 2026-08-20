cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.60"
  sha256 arm:   "e822706f34343a89610e5f86f405bd9e3609f2a13bbfb4fd857420804fb0a5af",
         intel: "186d39202a74fe041413103d3ec186f32253759f661af719663865ebdb8bdf9c"

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
