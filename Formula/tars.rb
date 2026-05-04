class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.157"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.157/tars_0.31.157_darwin_arm64.tar.gz"
      sha256 "7230c571689054f5df5fd5a6895825e8e26577b047547f23e5e16e16216cd073"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.157/tars_0.31.157_darwin_amd64.tar.gz"
      sha256 "12b2bd430f5a61cac688d2fc04163ac2deb52870136a1810112e5760a9bd4398"
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
