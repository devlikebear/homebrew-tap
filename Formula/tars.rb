class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.33.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.33.1/tars_0.33.1_darwin_arm64.tar.gz"
      sha256 "10cb1eefd0cf7bab58c66a585326b45e17acdbde32e7f82b92612f6739906a46"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.33.1/tars_0.33.1_darwin_amd64.tar.gz"
      sha256 "ee5912be7840ce93d599512e453c6b98771f29c94ab1dbb54b1eeeccfedaf4d8"
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
