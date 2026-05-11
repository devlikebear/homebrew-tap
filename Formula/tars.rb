class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.33/tars_0.32.33_darwin_arm64.tar.gz"
      sha256 "336e16ca7d6f49c7c21c50b2ce68f30daf4520e46ac000bf2281647777f5d42b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.33/tars_0.32.33_darwin_amd64.tar.gz"
      sha256 "a5fa1391d17200c7bd3639045ab2a32fa47d06362af3e3550bd584b4c98d8bb7"
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
