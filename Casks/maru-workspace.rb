cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.20"
  sha256 arm: "8b35cf3b9eb0f578b7b015ae57d45e9a3ef16cb9138d10435a0d7dbf3fdbaebb",
         intel: "6ec29190afb7e1ff2e5f5030505af46046c8cd03791734bfb05f5080d3a337d2"

  url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/Maru_#{version}_darwin_#{arch}_dmg.dmg"
  name "Maru"
  desc "Local-first AI workspace desktop app"
  homepage "https://github.com/STAIxBWLB/maru"

  # Bundles are Developer ID signed but not currently notarized. The
  # postflight strips com.apple.quarantine so brew users open the app
  # directly instead of seeing the Gatekeeper prompt that direct .dmg
  # downloaders see.
  app "Maru.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Maru.app"]
  end

  zap trash: [
    "~/Library/Application Support/kr.maru.desktop",
    "~/Library/Caches/kr.maru.desktop",
    "~/Library/Preferences/kr.maru.desktop.plist",
  ]
end
