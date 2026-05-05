class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.165"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.165/tars_0.31.165_darwin_arm64.tar.gz"
      sha256 "543a69dcf2e4a978d3246feb2282fd5d792e56ad7db226cf6c6eb070be955638"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.165/tars_0.31.165_darwin_amd64.tar.gz"
      sha256 "2cc404ee52d453d7ef185d941f6ca8dea94907cc237c6847d2f7f001985644e2"
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
