class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.112"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.112/tars_0.31.112_darwin_arm64.tar.gz"
      sha256 "00c986ade37b6071817e14cdda3d41e882d597be089733d5c2062b06928750aa"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.112/tars_0.31.112_darwin_amd64.tar.gz"
      sha256 "85103bfe35a79b85183cc4d8f01d7a34ebadbc4d66c0486cd0cb78cb8823c82b"
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
