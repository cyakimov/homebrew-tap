class Treepi < Formula
  desc "Git worktrees done right"
  homepage "https://github.com/cyakimov/treepi"
  url "https://github.com/cyakimov/treepi/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "271b1c75ae9eed85bc2a40b8a9898dd8576be1f6fe9fab4932f2c6882a01149b"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/treepi"
    bin.install "treepi"
    bin.install_symlink "treepi" => "tp"
  end

  test do
    assert_match "treepi version #{version}", shell_output("#{bin}/treepi --version")
  end
end
