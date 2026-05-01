class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.91"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.91/tars_0.31.91_darwin_arm64.tar.gz"
      sha256 "004df34b1a09ecceb47d2c6cd4533004c74a49458f16b2114b1207ad2d1e49f2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.91/tars_0.31.91_darwin_amd64.tar.gz"
      sha256 "bc849e6e6e0d77cb2d001b36c084e2111af37fbc862ccc7272b597c976ebb477"
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
