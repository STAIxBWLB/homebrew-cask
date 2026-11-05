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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.26/maru-cli_1.1.26_darwin_aarch64.tar.gz"
      sha256 "b8b33a86394b0885e9c41e0307bf52d3ad6e859bc3456e0216593b687b31c521"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.26/maru-cli_1.1.26_darwin_x86_64.tar.gz"
      sha256 "ac6e09f786d669d197f9c5f30adf311aceb083314780875165dc98a2b17f10ab"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
