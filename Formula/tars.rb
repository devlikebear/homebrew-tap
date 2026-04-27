class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.12/tars_0.31.12_darwin_arm64.tar.gz"
      sha256 "a56041f00ea7869ef8021aa6d21a8c2661d5d6e2c4391c0dabea11f3c0ab8ce1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.12/tars_0.31.12_darwin_amd64.tar.gz"
      sha256 "5869d8c957232078d416b944be3c7d7a7cc70839cbe15109b841fdd0c60a1dad"
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
