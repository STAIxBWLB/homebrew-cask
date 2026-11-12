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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.29/maru-cli_1.1.29_darwin_aarch64.tar.gz"
      sha256 "9f3b51b712a7b332a4d3beacb204e0d847765ea4853ac64655ddc43aba12ee0d"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.29/maru-cli_1.1.29_darwin_x86_64.tar.gz"
      sha256 "69bd2784fc63555039736b9047c8f7feeb24488c87ab34974dce7868f6bad6e7"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
