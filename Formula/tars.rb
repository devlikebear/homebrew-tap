class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.26/tars_0.31.26_darwin_arm64.tar.gz"
      sha256 "4fc0e8cfc897498783e5f3dfb40fe07ddea2ce7bea98b4d51cbe0d9cd9614ac1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.26/tars_0.31.26_darwin_amd64.tar.gz"
      sha256 "98c14bd6db48595b19aaa7423dc85b3041bd98b5b58ddb52816397e3d764318a"
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
