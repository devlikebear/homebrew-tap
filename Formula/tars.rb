class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.138"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.138/tars_0.31.138_darwin_arm64.tar.gz"
      sha256 "6dc747c9377b3b34ad2b2f0f96d993b2c811090083e18648df1d8a75973eea92"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.138/tars_0.31.138_darwin_amd64.tar.gz"
      sha256 "cf9526e43d7cb3122322921a8b110ca39e076be930d8d4052d9c22d22a3e4e0e"
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
