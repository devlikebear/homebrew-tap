class GitContrib < Formula
  desc "Git multi-repo developer contribution analyzer with HTML reports"
  homepage "https://github.com/devlikebear/git-contrib"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.3.0/git-contrib-v0.3.0-darwin-arm64.tar.gz"
      sha256 "62c96c6715c5a0135545ae440cbe746647326532b471166ccd5231e8454d0e0c"
    elsif Hardware::CPU.intel?
      url "https://github.com/devlikebear/git-contrib/releases/download/v0.3.0/git-contrib-v0.3.0-darwin-amd64.tar.gz"
      sha256 "b4ed0b2de763ba467b40b6d81cd4a05479722190649bc89bc07d279ec35f0d05"
    end
  end

  def install
    bin.install "git-contrib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-contrib --version")
  end
end
