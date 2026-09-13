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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.7/maru-cli_1.1.7_darwin_aarch64.tar.gz"
      sha256 "6fe5aefe1c9bcc6768e7434d13f5ef9b65d5193db3d74df49bfc63dc3fb494d7"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.7/maru-cli_1.1.7_darwin_x86_64.tar.gz"
      sha256 "d635b90a0f13463cf4b9e04f5ad83e5bbc43bff9dce72d86312d9e17bdfae62d"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
