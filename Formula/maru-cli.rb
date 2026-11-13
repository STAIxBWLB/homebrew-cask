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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.30/maru-cli_1.1.30_darwin_aarch64.tar.gz"
      sha256 "3caeea4183e0b620a14debd99fac6e7401a72bda4a2f3c9a464d12ade16ab2b9"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.30/maru-cli_1.1.30_darwin_x86_64.tar.gz"
      sha256 "a41a4f6aec0f5ee7e99fd61c08635d1f2ac06da07367f18d142f773b1de1e907"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
