class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.27/tars_0.32.27_darwin_arm64.tar.gz"
      sha256 "e3a92259a6665f260628d51f444c3742f34c2e4241d4b7b175b9437c2cc9cc87"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.27/tars_0.32.27_darwin_amd64.tar.gz"
      sha256 "bda4b845c098a8e5b76ac4ec1bc831f612e6c8921dc0ef4ae16aa06d13f39c3d"
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
