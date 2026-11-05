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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.25/maru-cli_1.1.25_darwin_aarch64.tar.gz"
      sha256 "648c482ab967b98bbb67c2c38b9616ac31450fe0298bae29b768edd19e283607"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.25/maru-cli_1.1.25_darwin_x86_64.tar.gz"
      sha256 "c96ffe97cd09b2d994e42239571ce50f839ed0e6f4481c261be8cbca9b46a07a"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
