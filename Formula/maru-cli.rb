class MaruCli < Formula
  desc "Command-line interface for Maru Workspace"
  homepage "https://github.com/STAIxBWLB/maru"
  version "0.4.15"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "e5e1a096738b3b53a354d93b15115bd9373c947ecb06b633abdaa5300f4fd121"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "11a120005afa4366b5eb793597703be80431bf29fc90babefc9e27016915e498"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
