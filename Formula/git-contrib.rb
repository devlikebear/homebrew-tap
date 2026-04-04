class GitContrib < Formula
  desc "Git multi-repo developer contribution analyzer with HTML reports"
  homepage "https://github.com/devlikebear/git-contrib"
  license "MIT"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.3.2/git-contrib-v0.3.2-darwin-arm64.tar.gz"
      sha256 "1f899c88b81665fce1bffe109afb29e93599fdb67925e391051e6a11bbbf9f75"
    elsif Hardware::CPU.intel?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.3.2/git-contrib-v0.3.2-darwin-amd64.tar.gz"
      sha256 "15df7cee63ae25db262e094e669e942e8464845bde39229060bd112afa1b342d"
    end
  end

  def install
    bin.install "git-contrib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-contrib --version")
  end
end
