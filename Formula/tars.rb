class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.171"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.171/tars_0.31.171_darwin_arm64.tar.gz"
      sha256 "2d7028db8cb5cca244778e66740e96f42de53c8b6c03c8d60d544709ec490a97"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.171/tars_0.31.171_darwin_amd64.tar.gz"
      sha256 "64233f5adc911a35fbb645f86d1ddb440ed6f2e10e7429d97785aed4b0e25925"
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
