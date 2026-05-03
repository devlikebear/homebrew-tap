class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.136"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.136/tars_0.31.136_darwin_arm64.tar.gz"
      sha256 "c73826f0e396272c619f044df63346267597f8e1bb0c2987fd5d3246b610b306"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.136/tars_0.31.136_darwin_amd64.tar.gz"
      sha256 "822ac62b5a24d19ffa55b48ad6bda81bd1cd5bdf907417c38771e2fa20f0bb06"
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
