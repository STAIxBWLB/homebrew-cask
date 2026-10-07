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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.19/maru-cli_1.1.19_darwin_aarch64.tar.gz"
      sha256 "a942cde97b3cf6c779fd04ad6e22955561284c4cdbf5cdf0272422e104a3b3af"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.19/maru-cli_1.1.19_darwin_x86_64.tar.gz"
      sha256 "7623f3e1f3dc5f1c8f60e077f36688303ffa134482926efbb526a9da3f068248"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
