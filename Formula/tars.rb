class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.34.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.34.0/tars_0.34.0_darwin_arm64.tar.gz"
      sha256 "0265059f281d3ecf7ca3061589731fface6e67e25b54a52d7fcb52d8e702f527"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.34.0/tars_0.34.0_darwin_amd64.tar.gz"
      sha256 "b737c1a71ea3fdc6aae42ee1fcf044e2bbd5be33c00289c041d10eaea61834c8"
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
