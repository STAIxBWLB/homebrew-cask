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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.23/maru-cli_1.1.23_darwin_aarch64.tar.gz"
      sha256 "68100e95fab6faf631cb3515c1a59e484c3850ed21a80d8b5567dd88ca84096b"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.23/maru-cli_1.1.23_darwin_x86_64.tar.gz"
      sha256 "4837a643e864a756390f0d2f7cc5e1e69a2dbb018613a1c5daa0face6d0bf98c"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
