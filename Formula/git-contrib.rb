class GitContrib < Formula
  desc "Git multi-repo developer contribution analyzer with HTML reports"
  homepage "https://github.com/devlikebear/git-contrib"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.2.0/git-contrib-v0.2.0-darwin-arm64.tar.gz"
      sha256 "775e7f5c8d7458dcf6a2894545a6345878e51ba889bce611b5e98d2f96ce0a9e"
    elsif Hardware::CPU.intel?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.2.0/git-contrib-v0.2.0-darwin-amd64.tar.gz"
      sha256 "4be6fddb2867f921e952ab2a2da39bd9915d90ef069ae707abf4f039adb1ee78"
    end
  end

  def install
    bin.install "git-contrib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-contrib --version")
  end
end
