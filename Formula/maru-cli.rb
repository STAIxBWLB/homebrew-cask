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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.31/maru-cli_1.1.31_darwin_aarch64.tar.gz"
      sha256 "dbc360e89a34267a3e8f88b9f423002b4da0de23936de3cc4219a0d9d51a3bd9"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.31/maru-cli_1.1.31_darwin_x86_64.tar.gz"
      sha256 "4ce0e0a79b40560efec42c53e8ff79a1670ed53da973edc5725413bf7959e9c2"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
