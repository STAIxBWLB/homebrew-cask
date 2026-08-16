class MaruCli < Formula
  desc "Command-line interface for Maru Workspace"
  homepage "https://github.com/STAIxBWLB/maru"
  version "0.4.51"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "0f9c5656fc77b29502060144c7bcf893c1f75b07aa21d43c8f2b36af33634d0f"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "5463b80345d8d44bf1b3dacbccb266122a6d1d5a20d7b31b2673c1bf536989b6"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
