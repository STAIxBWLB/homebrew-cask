class AnchorCli < Formula
  desc "Command-line interface for Anchor Workspace"
  homepage "https://github.com/STAIxBWLB/anchor"
  version "0.2.20"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "1412f342fac5097ab48565a8b34f0a0d18077b7d53d47c9ff1ab4e48b0ee5d57"
    else
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "6e45e27f140f86b6cc94e555e9443f8fa460d4f6509b1a0e35f631edaf5884b3"
    end
  end

  def install
    bin.install "anchor"
  end

  test do
    assert_match "anchor #{version}", shell_output("#{bin}/anchor --version")
  end
end
