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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.3/maru-cli_1.1.3_darwin_aarch64.tar.gz"
      sha256 "7bec19eafcc6b5a2548ecae596911542d56271f1f92fb23b02e93817c11807d6"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.3/maru-cli_1.1.3_darwin_x86_64.tar.gz"
      sha256 "86421617264e84d65f8e1edac907725cf1b5dbdae752e8b5f8f1d4a4d01eaaa4"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
