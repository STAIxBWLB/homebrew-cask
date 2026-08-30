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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.1/maru-cli_1.1.1_darwin_aarch64.tar.gz"
      sha256 "675fad9177cf93abf605ad392ce20791a89d054060f35a3e6695725350f0f4d4"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.1/maru-cli_1.1.1_darwin_x86_64.tar.gz"
      sha256 "785688f947be06f446cbcbbdf66b2fb89f3ada927821b39d69f003116c2100fd"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
