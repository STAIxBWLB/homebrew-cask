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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.18/maru-cli_1.1.18_darwin_aarch64.tar.gz"
      sha256 "f83db1e3fe86db470a5de664e2e851207d93d4bba2a595a61f590a004e7332fa"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.18/maru-cli_1.1.18_darwin_x86_64.tar.gz"
      sha256 "ed924a2f681ef99fa648741c0aeec1c078f0f290ddc77f71b2c58c467e123429"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
