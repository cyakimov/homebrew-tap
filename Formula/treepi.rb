class Treepi < Formula
  desc "Git worktrees done right"
  homepage "https://github.com/cyakimov/treepi"
  url "https://github.com/cyakimov/treepi/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "84a4f32783758ca1533032c0046d63d927432d24c5893c9b8be701006bd592b8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/cyakimov/homebrew-tap/releases/download/treepi-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0b649707bf30c3dafcfce65f5ee8117ea99389eaed393deabe966e8b0cecb3a9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ac727d68356d5e05739d6431558f8f28ab375d063d4ef3f7b091b2c2ecdaf0c2"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "f64ff9e453fbf725a27ca3065df7834ad2186acf39ed7ac84320d07fad55b741"
    sha256 cellar: :any,                 x86_64_linux:  "84fda2062d275832d33dbf14848714687491e2260fe1f1a67e5dd318fb540662"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/treepi"
    bin.install_symlink "treepi" => "tp"
  end

  test do
    assert_match "treepi version #{version}", shell_output("#{bin}/treepi --version")
    assert_match "treepi version #{version}", shell_output("#{bin}/tp --version")
  end
end
