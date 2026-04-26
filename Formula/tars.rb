class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.29.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.29.1/tars_0.29.1_darwin_arm64.tar.gz"
      sha256 "6b09ad030c1c373bf5ccac68833077023a47a270151fbdde34cfe280bb002838"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.29.1/tars_0.29.1_darwin_amd64.tar.gz"
      sha256 "a5b74176cc2f3259fa4172567a5585147934fe48f1c343af561e1119344aeee4"
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
