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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.0/maru-cli_1.1.0_darwin_aarch64.tar.gz"
      sha256 "2e8e73f09230a595ffa00840932daceb29d36b578f48cb9057111e97ba13cc94"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.0/maru-cli_1.1.0_darwin_x86_64.tar.gz"
      sha256 "356c4d36bae0ad36dbe48bd04e98685ecd1e0c81f4e0d7812092bb0419f4675f"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
