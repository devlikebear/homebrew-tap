class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.48/tars_0.32.48_darwin_arm64.tar.gz"
      sha256 "dce6af266524c5986c91ce01ed47d7d83e27bebd50b80efebd35fd4a8af3c6a0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.48/tars_0.32.48_darwin_amd64.tar.gz"
      sha256 "a719a5e138f25bb2b72a03ce41b76a85f14bcb688e7f61dc546bc2a9d1fa26e5"
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
