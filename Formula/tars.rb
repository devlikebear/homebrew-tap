class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.60"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.60/tars_0.32.60_darwin_arm64.tar.gz"
      sha256 "b7c3a80fe06f347114fd02fb4272f244f9b6447ffa33456887cf550963cd480c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.60/tars_0.32.60_darwin_amd64.tar.gz"
      sha256 "54e6e8b3c23914fc6857e123aa4d1f9ff0a6a564ee678d7b1e2b6046d0e4544a"
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
