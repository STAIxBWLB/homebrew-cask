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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.24/maru-cli_1.1.24_darwin_aarch64.tar.gz"
      sha256 "b22bf1408883523ebdc59b17d5e2817e06051ac6f2d75241aa6beaf9ab4c3a7e"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.24/maru-cli_1.1.24_darwin_x86_64.tar.gz"
      sha256 "b279639de1c9663c437c83ed2570bbb2e57f6bd6ff43bc747d11f91361c13f05"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
