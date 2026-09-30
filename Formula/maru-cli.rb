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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.15/maru-cli_1.1.15_darwin_aarch64.tar.gz"
      sha256 "6e6611284bce6f891bd2ba7b79ab59299905be730ddd0a2caa85af52f3ec235e"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.15/maru-cli_1.1.15_darwin_x86_64.tar.gz"
      sha256 "46e6a279a178bf393b7d2a060c44cc110c152b27b3d2d3ca2f86a88b309f796b"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
