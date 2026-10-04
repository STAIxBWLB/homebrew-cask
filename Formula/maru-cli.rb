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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.16/maru-cli_1.1.16_darwin_aarch64.tar.gz"
      sha256 "6cec5314379f64a1f014d17dd29e48b6cb2b5c9908915bca0a230e928f120d4f"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.16/maru-cli_1.1.16_darwin_x86_64.tar.gz"
      sha256 "07fb8dc2d0b4071c5fc040b73b3a830759f2a5de130de4dbee4fbbcbd8c0b172"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
