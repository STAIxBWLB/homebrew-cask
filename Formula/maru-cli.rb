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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.5/maru-cli_1.1.5_darwin_aarch64.tar.gz"
      sha256 "36676fc784ea14219af00e55f33ccbdab7ea7d861f1dc89b47eb270955e63377"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.5/maru-cli_1.1.5_darwin_x86_64.tar.gz"
      sha256 "97c37ecd8c995f9dca06b5f5539e96a8823521e8e8dc656fe9ea5dae80d93b57"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
