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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.21/maru-cli_1.1.21_darwin_aarch64.tar.gz"
      sha256 "2df9803933d5dde3069eb1ce73a28137358c88e140e62043f72a44b2fb091aed"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.21/maru-cli_1.1.21_darwin_x86_64.tar.gz"
      sha256 "e8a220663525dea3848e868776c8ae6c7dab8fc99c114eb4fdaba70e458efa4c"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
