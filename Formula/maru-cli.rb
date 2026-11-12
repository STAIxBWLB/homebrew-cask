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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.28/maru-cli_1.1.28_darwin_aarch64.tar.gz"
      sha256 "60d35a6dbd0a8a416029c53cd1dccdb11176d6f769900e3aca6bbe048d8f386f"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.28/maru-cli_1.1.28_darwin_x86_64.tar.gz"
      sha256 "0616e993337ef930c1c9bfc8a605c036544553353c81fd00c5c46863050e3c45"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
