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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.32/maru-cli_1.1.32_darwin_aarch64.tar.gz"
      sha256 "44e70dddc12a2b434e7afa8e65666819f92ac0f101406efb6a8e4c3df90307fa"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.32/maru-cli_1.1.32_darwin_x86_64.tar.gz"
      sha256 "d530d73b7e5406b9291ff27c8e87dbf8ad42ba75e3841d1dfff91b9bf29b3c77"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
