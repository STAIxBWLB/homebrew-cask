class AnchorCli < Formula
  desc "Command-line interface for Anchor Workspace"
  homepage "https://github.com/STAIxBWLB/anchor"
  version "0.2.32"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "fa8e8df53a7de6d85d88f31de69192e144ea5e0466a13a5ec74c4e7d3256eae6"
    else
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "f4e70e9591f17c05340fe04fcb782801959a2ea0e9b41ea56308f0b1c1887670"
    end
  end

  def install
    bin.install "anchor"
  end

  test do
    assert_match "anchor #{version}", shell_output("#{bin}/anchor --version")
  end
end
