class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.160"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.160/tars_0.31.160_darwin_arm64.tar.gz"
      sha256 "69c0057f535069101828e301661fd22cde826724e25f1243f9ea07ddc11c1f44"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.160/tars_0.31.160_darwin_amd64.tar.gz"
      sha256 "983bc833cec5d70aa0608c3574794f88c16f85c5df455c41fc8daeec2d9b028d"
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
