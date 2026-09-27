class Metron < Formula
  desc "Live Claude and Codex account limits in your terminal"
  homepage "https://github.com/cyakimov/metron"
  url "https://github.com/cyakimov/metron/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "35c66b94fc8a7eb0d1eab743392ccc95ab83303edca1408e57770e6b056278df"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/metron"
  end

  test do
    assert_match "metron version #{version}", shell_output("#{bin}/metron --version")
    assert_match "r refresh", shell_output("#{bin}/metron --help 2>&1")
    assert_match "open an interactive terminal", pipe_output("#{bin}/metron 2>&1", "", 1)
  end
end
