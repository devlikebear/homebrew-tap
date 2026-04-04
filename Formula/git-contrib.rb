class GitContrib < Formula
  desc "Git multi-repo developer contribution analyzer with HTML reports"
  homepage "https://github.com/devlikebear/git-contrib"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.1.0/git-contrib-v0.1.0-darwin-arm64.tar.gz"
      sha256 "9c5e40f14cadf2c5c6b49cea583779ad08b4340e0e801c9fb0c0ef946ad9732a"
    elsif Hardware::CPU.intel?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.1.0/git-contrib-v0.1.0-darwin-amd64.tar.gz"
      sha256 "022557900c1862c7134c521ddc43633f5bb1bb1e78c8a808a81d245a7552fe36"
    end
  end

  def install
    bin.install "git-contrib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-contrib --version")
  end
end
