class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.15.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.15.1/tars_0.15.1_darwin_arm64.tar.gz"
      sha256 "0deb4ee7e892a121c1273e3b5c106b8c5070d82612ca37266ebe23bd89178f45"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.15.1/tars_0.15.1_darwin_amd64.tar.gz"
      sha256 "17008c397df53b5dea7ce334b49d2cb9847a29a4708de5d0e78c89ce7df50149"
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
