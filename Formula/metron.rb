class Metron < Formula
  desc "Live Claude and Codex account limits in your terminal"
  homepage "https://github.com/cyakimov/metron"
  url "https://github.com/cyakimov/metron/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "6280d424d4ac8ca36d8f4027e5c0096681fbdf0840e9c4c9fdf8865226e2320e"
  license "MIT"

  bottle do
    root_url "https://github.com/cyakimov/homebrew-tap/releases/download/metron-0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1957911fb3208811248886e5bde4b7a6d63b16330ab4f9447d7d2e04c343fdb1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3215a8e2cc29e687e1248fb4b71a32cf021be615a1650dade5d9d1881a1efeb5"
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
