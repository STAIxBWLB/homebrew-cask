cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.3"
  sha256 arm:   "219c169d677c8230f0a6a7dcd491b7e239bb7f283cc1bc5a283ec7d0edc37973",
         intel: "718cc6789c23e38297c55d4fc59b1dfa9000b193ec0f5a8c785a2bd66b594653"

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
