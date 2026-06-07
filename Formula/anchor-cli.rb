class AnchorCli < Formula
  desc "Command-line interface for Anchor Workspace"
  homepage "https://github.com/STAIxBWLB/anchor"
  version "0.2.33"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "4bb56221244a760c8e0dd4a9715aaac7d9a22b3bfd6cecde1eb386f98908f53a"
    else
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "2e7595d0c816b215ca196b98ad53e17dae094641569901f6e839f8ed71ada4b5"
    end
  end

  def install
    bin.install "anchor"
  end

  test do
    assert_match "anchor #{version}", shell_output("#{bin}/anchor --version")
  end
end
