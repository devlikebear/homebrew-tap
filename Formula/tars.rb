class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.13.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.13.3/tars_0.13.3_darwin_arm64.tar.gz"
      sha256 "1465c2dfe82b1a92082f2679dd81393b1f5b66a12173c981f8a13d232a6b1432"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.13.3/tars_0.13.3_darwin_amd64.tar.gz"
      sha256 "a26782d3838a441965a5148372eb3d410e9520eb70bbcae82d53e33877a7ca64"
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
