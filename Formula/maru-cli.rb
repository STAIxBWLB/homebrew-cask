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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.8/maru-cli_1.1.8_darwin_aarch64.tar.gz"
      sha256 "530cda5db8679f4cadf0848dedb399df6f414b70562b16a85dc524d008c86347"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.8/maru-cli_1.1.8_darwin_x86_64.tar.gz"
      sha256 "4456d335945906e8822d5d84ff55a645842542e25d37f6f408f4884472d08b2b"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
