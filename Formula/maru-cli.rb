class MaruCli < Formula
  desc "Command-line interface for Maru Workspace"
  homepage "https://github.com/STAIxBWLB/maru"
  version "0.4.22"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "0237be36411934ec3ab97fbcf9a311d6a1f26c1f04c48653da169f22dfa4d15f"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "493911dac405caeb2a7738d13ec05408cb715ae373ca08d26a0cf9ed3668af95"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
