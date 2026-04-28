class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.21/tars_0.31.21_darwin_arm64.tar.gz"
      sha256 "970d0ef6680c9956e0baf94ec1e3c1a4ffddd1cb07b7438db1c222e1bc1d09ab"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.21/tars_0.31.21_darwin_amd64.tar.gz"
      sha256 "7575b75b1e5d9c16d32497d648c9293598034ab1df975d38d091b5cd7b551268"
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
