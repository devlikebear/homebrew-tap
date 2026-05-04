class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.142"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.142/tars_0.31.142_darwin_arm64.tar.gz"
      sha256 "014ffd3519e1b33e73278857d23561d852f829ae0a0155a513571f7db1b3eead"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.142/tars_0.31.142_darwin_amd64.tar.gz"
      sha256 "b475850a27375c2e30911459dbe765dba928ee0621a4753a9bbee04500d061df"
    end
  end

  def install
    bin.install "tars"
    prefix.install "share" if Dir.exist?("share")
  end

  def caveats
    <<~EOS
      Optional assistant dependencies are not installed by this formula.
      Install them separately when needed:
        brew install ffmpeg whisper-cpp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
