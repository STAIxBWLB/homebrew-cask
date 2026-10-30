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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.22/maru-cli_1.1.22_darwin_aarch64.tar.gz"
      sha256 "cb1297dc80bf49cfc5663ab848e1bbe064fce60b9247b38cdfb0b2b77da204eb"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.22/maru-cli_1.1.22_darwin_x86_64.tar.gz"
      sha256 "73f9608a3649edf9243a7935d4a19c2d65dcb5c42572f0701d47fabd09e0269f"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
