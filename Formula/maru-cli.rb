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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.17/maru-cli_1.1.17_darwin_aarch64.tar.gz"
      sha256 "8e144f01e967a8776165b0d7397d210507f5af265f452a0dec29b48ef1d3f9e1"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.17/maru-cli_1.1.17_darwin_x86_64.tar.gz"
      sha256 "9d5c82a881f1783c1e3c989291ea523f6b9c3804891e16cd9a474058402806d2"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
