class Metron < Formula
  desc "Live Claude and Codex account limits in your terminal"
  homepage "https://github.com/cyakimov/metron"
  url "https://github.com/cyakimov/metron/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "adb9290cf661eb6df80efd3a1b8820cae5286f5bd74c9600c8c1eeb4ded60cfd"
  license "MIT"

  bottle do
    root_url "https://github.com/cyakimov/homebrew-tap/releases/download/metron-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "530b4f17ea9e59567b8d07bed7462e4e77400ec0dee49bd577acced0a0ea2604"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "827b6815722b50db95cd477542f9cf481578184b23d8e0668acd7f0c14fe29d9"
  end

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/metron"
  end

  test do
    assert_match "metron version #{version}", shell_output("#{bin}/metron --version")
    help = shell_output("#{bin}/metron --help 2>&1")
    assert_match "r refresh", help
    assert_match "refresh-interval", help
    assert_match "claude-refresh-interval", help
    assert_match "codex-refresh-interval", help
    assert_match "must be a positive duration", shell_output("#{bin}/metron --refresh-interval=0 2>&1", 2)
    assert_match "open an interactive terminal", pipe_output("#{bin}/metron 2>&1", "", 1)
  end
end
