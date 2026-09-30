class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.7/tars_0.40.7_darwin_arm64.tar.gz"
      sha256 "d7fc885c15858a29d8c7d6cc30e1fe74415d132507a7d51a1f6098abd48634a8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.7/tars_0.40.7_darwin_amd64.tar.gz"
      sha256 "db58a21a3b5f031cc8266cca9077b0598eeb30c9b5cf799dca1f1c2d3c6584e1"
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
