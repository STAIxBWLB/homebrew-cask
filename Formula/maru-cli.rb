class MaruCli < Formula
  desc "Command-line interface for Maru Workspace"
  homepage "https://github.com/STAIxBWLB/maru"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.10/maru-cli_1.1.10_darwin_aarch64.tar.gz"
      sha256 "df9a35c68eabab24cb32388c7b543fa825208a9bf1f92e9f938a92e7da5bf5d0"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.10/maru-cli_1.1.10_darwin_x86_64.tar.gz"
      sha256 "34bb8c705db0b1044abf85f60c3658698ba139f8333c2f473a9c5f017897b549"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
