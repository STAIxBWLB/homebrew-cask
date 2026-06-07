class AnchorCli < Formula
  desc "Command-line interface for Anchor Workspace"
  homepage "https://github.com/STAIxBWLB/anchor"
  version "0.2.34"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "f1b5435a2bd32636f092ffb7efafd2f26ef4f2838051c00f0441d923fd070a1b"
    else
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "37d2dd5bce180529e01a5ee9423a917ca0c966da5942ff4338e2e90865f1c7e1"
    end
  end

  def install
    bin.install "anchor"
  end

  test do
    assert_match "anchor #{version}", shell_output("#{bin}/anchor --version")
  end
end
