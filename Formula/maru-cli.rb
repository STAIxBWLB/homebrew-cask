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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.27/maru-cli_1.1.27_darwin_aarch64.tar.gz"
      sha256 "7724874eb0a24d6d2d57ded1c7f17cdfe54c1d182dd7a00df323c47be1e0db30"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.27/maru-cli_1.1.27_darwin_x86_64.tar.gz"
      sha256 "c36f391d4214f28eec6cdc11ce9e174f63b5069fc6b13112bf5b0911625e3a5f"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
