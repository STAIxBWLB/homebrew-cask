cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.10"
  sha256 arm:   "43f36cf8d4fc9cd17ff3cd72743995b6c3d3ddcdc1afaf73d667bc83b9818915",
         intel: "d0a47692887a35356cbe206335386b669cac6237e30393c0e31a373fd8bf91f9"

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
