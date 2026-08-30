cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.1"
  sha256 arm:   "4265386949ec146948d24d1dfe0193bcba9f3bc7b4f523e5fe880d94a883dae2",
         intel: "e3243db826dcca8346e7f03f3af51c783bc64578b72a1c81027abb166989a842"

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
