class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.170"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.170/tars_0.31.170_darwin_arm64.tar.gz"
      sha256 "7cbc4fdb0f573e26a4e279212908fd49d7844c4e30d417677fc29238397fc0c9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.170/tars_0.31.170_darwin_amd64.tar.gz"
      sha256 "93841198aad229cbf9469ff3e9474763f4ea4976602f281dafc1cf201849a237"
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
