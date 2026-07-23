cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.15"
  sha256 arm: "7e2ba123b347415dd2e814f1a2eb4c274626d994a7872662d472959c3456729d",
         intel: "80ec3e19a00855e66e3940b193c5e87a109476383e54c15ace706b4c284c42cf"

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
