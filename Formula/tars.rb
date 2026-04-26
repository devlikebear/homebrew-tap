class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.4/tars_0.31.4_darwin_arm64.tar.gz"
      sha256 "a0f986ecd2ddfef897108ec6f69e8758e519219eb7ef4e85ae3543784de317fb"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.4/tars_0.31.4_darwin_amd64.tar.gz"
      sha256 "e472f608e0160c8c715657041c2275878fb95cc7d81282562597fe0e2e587215"
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
