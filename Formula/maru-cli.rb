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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.11/maru-cli_1.1.11_darwin_aarch64.tar.gz"
      sha256 "b5605c04d65ba194cd443f784791096c64f4b5496fbd044a9afb65fbf9fe5948"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.11/maru-cli_1.1.11_darwin_x86_64.tar.gz"
      sha256 "9b1c9b69c38105ecf81affaeaeafc879658d8dada36f6b716c151d8fd6dff3f8"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
