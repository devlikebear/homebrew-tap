class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.40/tars_0.32.40_darwin_arm64.tar.gz"
      sha256 "111c99cd7886de9a6a08042672334a83b7e44bfbdd2e9943012ea51cbb71d4ec"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.40/tars_0.32.40_darwin_amd64.tar.gz"
      sha256 "6c9b9a2f704fbde96776808ea8780f1dad2313203f1eb893c242f1dd9a911a05"
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
