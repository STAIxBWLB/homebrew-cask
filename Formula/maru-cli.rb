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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.33/maru-cli_1.1.33_darwin_aarch64.tar.gz"
      sha256 "79097a08b551be97f97fd72f9b8841545a784d8315cb065416e1e5c7485f10ff"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.33/maru-cli_1.1.33_darwin_x86_64.tar.gz"
      sha256 "f43f04e7e313b7a91ffa3adcd9ae82bfff6e522708c1cf8e5659383af737a879"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
