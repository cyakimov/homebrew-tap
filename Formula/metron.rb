class Metron < Formula
  desc "Live Claude and Codex account limits in your terminal"
  homepage "https://github.com/cyakimov/metron"
  url "https://github.com/cyakimov/metron/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "b263b92627c152e1a05ff68cedfca3e26072a347fb81decb9c41132988cf3f5b"
  license "MIT"

  bottle do
    root_url "https://github.com/cyakimov/homebrew-tap/releases/download/metron-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "d760b5864f72e5ef3441004ca53acc10baa77aff5a4c5144d7b4440d866c4808"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cb49163d6d2c887298069bf27086c543e2e17f0fdd491eea9c29b0a83b3e16d2"
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
