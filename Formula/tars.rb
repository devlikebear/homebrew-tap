class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.103"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.103/tars_0.31.103_darwin_arm64.tar.gz"
      sha256 "bc39093f979dd29a3d56a2d09f747b9cd22fcd6dd89fac727b9cdfe9325c6624"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.103/tars_0.31.103_darwin_amd64.tar.gz"
      sha256 "c38a26d8c7461c4cccb408261a3d827f7d38013822f66668a684d0ec1a4ffe02"
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
