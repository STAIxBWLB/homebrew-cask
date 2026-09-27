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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.13/maru-cli_1.1.13_darwin_aarch64.tar.gz"
      sha256 "9ea44c6b393888d16969499d62a3c09587e4bc6039cd92982870153789d4a4b4"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.13/maru-cli_1.1.13_darwin_x86_64.tar.gz"
      sha256 "525d6d78087da4feefdcc515465e6dd8cae109f101f7cc22a68ee0e76b05c5ee"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
