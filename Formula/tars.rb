class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.0/tars_0.31.0_darwin_arm64.tar.gz"
      sha256 "e2b756340d2db54a0f9233bffa87b64da2d298e3b04527026309b34aacc6a254"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.0/tars_0.31.0_darwin_amd64.tar.gz"
      sha256 "ec1553f250c26a80dd76406f6d2093f3e06cfc1c455f634081baa23292cd7e7f"
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
