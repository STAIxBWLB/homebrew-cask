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
      url "https://github.com/STAIxBWLB/maru/releases/download/v0.6.1/maru-cli_0.6.1_darwin_aarch64.tar.gz"
      sha256 "de9121a3edeeb80812513533b36b0600497a666fb467a33e64f847a52efbb06e"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v0.6.1/maru-cli_0.6.1_darwin_x86_64.tar.gz"
      sha256 "dc548b9638f98103b0d65d98c576c4e55ac28f3bdc35364d25627f5816da7cf7"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
