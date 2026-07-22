cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.9"
  sha256 arm: "c777cf00ee8dfcd76cabcc58c42d3af613e90b8b8b1907244908c90b456c5d85",
         intel: "4c06fa050d9cdd43fa4b7aa2ae1ec9fbeb14be07a1769759bad4c32c53f30e67"

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
