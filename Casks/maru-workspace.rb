cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.22"
  sha256 arm:   "9ffec1f9feca25a96b714f3d0c5886aa99d7bbcc9cf9426d7f6d5f9de3302831",
         intel: "ddbe4d7c6a60409c91b8e5b457672c11116aa279b704d1c6cd891e8fcb70ec55"

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
