class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.102"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.102/tars_0.31.102_darwin_arm64.tar.gz"
      sha256 "960c63b04d3b320d7c8a31747fa777ce820dfc6ed07faf5dad9eaa8ff857d5c0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.102/tars_0.31.102_darwin_amd64.tar.gz"
      sha256 "3e57ca84e59fadd7ff863b8a7f8f0d02613b7e918ebf8dd99391f03893ce2689"
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
