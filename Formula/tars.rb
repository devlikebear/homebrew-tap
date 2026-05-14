class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.51"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.51/tars_0.32.51_darwin_arm64.tar.gz"
      sha256 "06407923554643bc15a851a6cf3747b9e6d67691fd5c8a0dcf070f33e4fb1f48"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.51/tars_0.32.51_darwin_amd64.tar.gz"
      sha256 "6224be68d33033edea78343b3677d98d08ae99df2549a2a09273e77e33dfcbd1"
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
