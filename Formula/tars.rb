class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.79"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.79/tars_0.31.79_darwin_arm64.tar.gz"
      sha256 "a8b2108b870dbf7a5693a31167bc3165a47984d1d8717a68570b99d1e207bcff"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.79/tars_0.31.79_darwin_amd64.tar.gz"
      sha256 "01dfbd60125c65591ad88c62a23ded7a78ff0cd75371c4123374b2ba0be71188"
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
