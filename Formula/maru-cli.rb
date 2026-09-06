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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.4/maru-cli_1.1.4_darwin_aarch64.tar.gz"
      sha256 "aa192644927de94e57359ec8c98e7215bd7cca7c20eb95a1caec06789cf44137"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.4/maru-cli_1.1.4_darwin_x86_64.tar.gz"
      sha256 "5c9641107a4381f2ffc41f275b4ddaacaba130d2b8e9feda44112c9cc1cdc184"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
