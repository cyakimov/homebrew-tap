class Treepi < Formula
  desc "Git worktrees done right"
  homepage "https://github.com/cyakimov/treepi"
  url "https://github.com/cyakimov/treepi/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "84a4f32783758ca1533032c0046d63d927432d24c5893c9b8be701006bd592b8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/cyakimov/homebrew-tap/releases/download/treepi-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b5c1cf2f4907aa88f042d47c7eb612549e51f9f08c35ca0cc2d8ead9a5c11658"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ebe03f4785dfdb1bd472086463be0b93c1e3b2a29ad9d9ae50ac18368d427da"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "9b3c3b2820673c2399fc29a254429fdb364a7e72d769a493309016f7b6d89176"
    sha256 cellar: :any,                 x86_64_linux:  "47a969ec1f83548ab00f3b989fc9b14f3ecfc5926cb69955947b5f6a3635a719"
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
