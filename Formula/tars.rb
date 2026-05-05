class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.176"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.176/tars_0.31.176_darwin_arm64.tar.gz"
      sha256 "9abea7bed16584a879df3a9ddb9456654a29c7d7e83cfa33f448cce1be821f15"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.176/tars_0.31.176_darwin_amd64.tar.gz"
      sha256 "270044779b1b4a0aba9446aa61e9c52048d59d37a1bccc93563238832c3749a0"
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
