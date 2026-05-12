class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.38/tars_0.32.38_darwin_arm64.tar.gz"
      sha256 "71cdcacf634c29a885128b26c6620b7291c93e534a3b3e2edf7348fc6db7223b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.38/tars_0.32.38_darwin_amd64.tar.gz"
      sha256 "516ec5c2bafd66c5c5338ad67d2464c99ce477fe3cdaa1a2d5db2c28c3ec1300"
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
