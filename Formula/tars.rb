class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.90"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.90/tars_0.31.90_darwin_arm64.tar.gz"
      sha256 "47e349e3d765fd2335ae3013512258631e1d96c902b325a90886c3d172ca2a7c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.90/tars_0.31.90_darwin_amd64.tar.gz"
      sha256 "66bf73bab4bd15acf7c46ba0c6bc5d33ca98e7fb3597feee58f68ebfed6b1e61"
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
