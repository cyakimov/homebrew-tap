class Metron < Formula
  desc "Live Claude and Codex account limits in your terminal"
  homepage "https://github.com/cyakimov/metron"
  url "https://github.com/cyakimov/metron/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "a10d1a2b3a7e06942b300a110457f9b09d9d6fb34bfcabb02e790f8d6159b01f"
  license "MIT"

  bottle do
    root_url "https://github.com/cyakimov/homebrew-tap/releases/download/metron-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b8656e051b906b607eba587b06836deed521a73f39466eb90e65f6e295ec92ad"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aa0b353af8e34abc8452fb630e839475c5a9c621d4cbea54f764f9716dec37db"
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
