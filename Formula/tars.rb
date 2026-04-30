class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.66"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.66/tars_0.31.66_darwin_arm64.tar.gz"
      sha256 "537b670d04428a95c2bee11a7f8f242d082fc9a654d468949411f76231ea96fa"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.66/tars_0.31.66_darwin_amd64.tar.gz"
      sha256 "10c306b7945d149ff60d32b5edd7eeb50005ac3690ce92c438225c64f665233a"
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
