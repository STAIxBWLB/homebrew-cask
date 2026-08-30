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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.2/maru-cli_1.1.2_darwin_aarch64.tar.gz"
      sha256 "3ace26566afa4a442566ff6a48deaf89ef25900d7e2244f2be89460567508793"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.2/maru-cli_1.1.2_darwin_x86_64.tar.gz"
      sha256 "ad8c0a82f2a722db9fe8e8cf3d7f77f4a60458e8f502d32884fb93949a4e48c0"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
