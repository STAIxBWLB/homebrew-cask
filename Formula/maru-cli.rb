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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.6/maru-cli_1.1.6_darwin_aarch64.tar.gz"
      sha256 "f1fc980ad164d30cced94bb0ca2064dd0eedb59899740170aedc0e4206617929"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.6/maru-cli_1.1.6_darwin_x86_64.tar.gz"
      sha256 "a315904f1f042796eab6bbe152a3537b3507c36f21bc0102bbcda1b65b387d8e"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
