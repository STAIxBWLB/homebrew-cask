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
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.12/maru-cli_1.1.12_darwin_aarch64.tar.gz"
      sha256 "2836f8a8e368fcf76e5f5d51a1609ea089ee7bbce510c5c0911c54f114e53507"
    else
      url "https://github.com/STAIxBWLB/maru/releases/download/v1.1.12/maru-cli_1.1.12_darwin_x86_64.tar.gz"
      sha256 "417bc29a3d5e1884fbf989fd44d1cdec520a9a258f804172f35e2aaf9e2a3bbd"
    end
  end

  def install
    bin.install "maru"
  end

  test do
    assert_match "maru #{version}", shell_output("#{bin}/maru --version")
  end
end
