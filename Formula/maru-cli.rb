class MaruCli < Formula
  desc "Command-line interface for Maru Workspace"
  homepage "https://github.com/STAIxBWLB/maru"
  version "0.4.13"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_aarch64.tar.gz"
      sha256 "1fc5d27934915a8ff577f343da7142db4c74f02ec604715296e4f6c5f390e32b"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v#{version}/maru-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "61b4390ede68665e0c8c9f45bdf0fd45534df3666f554bf5c13e72895bff0d2a"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
