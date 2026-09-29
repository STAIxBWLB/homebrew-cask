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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.14/maru-cli_1.1.14_darwin_aarch64.tar.gz"
      sha256 "c33744cb7c11362c2d8840bfd0cbf7414e4ac80f2c941183d122691b5a2eb5a1"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.14/maru-cli_1.1.14_darwin_x86_64.tar.gz"
      sha256 "eb192e23a02b4a9d4d0f489d6fe9fb365fa84661e108d2a2614f2ec2afd7ceaa"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
