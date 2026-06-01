class AnchorCli < Formula
  desc "Command-line interface for Anchor Workspace"
  homepage "https://github.com/STAIxBWLB/anchor"
  version "0.2.26"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "8cca5dea0088ba750b4d91c4db5d1c07781111ceccafd7ee22fa35294f22e7bb"
    else
      url "https://github.com/STAIxBWLB/anchor/releases/download/v#{version}/anchor-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "fa1140b5bb3784027b272c5f11f69c5fed3215ebc5566a3c3e949762842668fb"
    end
  end

  def install
    bin.install "anchor"
  end

  test do
    assert_match "anchor #{version}", shell_output("#{bin}/anchor --version")
  end
end
