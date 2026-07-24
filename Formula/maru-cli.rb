class MaruCli < Formula
  desc "Command-line interface for Maru Workspace"
  homepage "https://github.com/STAIxBWLB/maru"
  version "0.4.19"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "ca6104571eb4ea0c0cd53570a40c66ce85786ca104e55d08c905602f73eaec11"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "bab89a8ff737fb16eb48f84c0abfa113cff5cf640f1565e8520fc3cff928d5a2"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
