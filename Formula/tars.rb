class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.6/tars_0.40.6_darwin_arm64.tar.gz"
      sha256 "f6f73aed653a5798461a451c1161b3ad345efe2ee760923dfe1e30967ddcc843"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.6/tars_0.40.6_darwin_amd64.tar.gz"
      sha256 "f23a5755210fb4eea119b8312269188759aa938502a2fbe7e1bbc13cc68d0dd9"
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
