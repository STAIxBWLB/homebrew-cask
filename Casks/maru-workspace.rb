cask "maru-workspace" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.7"
  sha256 arm:   "9ed5f8e550c8387920d23cf30730923ca0227a7aa57dbb95142c94985377a669",
         intel: "b9bae0f4f1d96ed754154c73ad17283a38093c2fc9fed9c20b649db97f208468"

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
