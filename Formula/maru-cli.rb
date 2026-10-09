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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.20/maru-cli_1.1.20_darwin_aarch64.tar.gz"
      sha256 "c2d2caa886cefae53ff7178676a64c349e938d1c7b18e296f6f3b067be832584"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.20/maru-cli_1.1.20_darwin_x86_64.tar.gz"
      sha256 "f06c42ef88fd5081156aa4b8215cb94c36d431e6a29590386618e6944622e9a8"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
