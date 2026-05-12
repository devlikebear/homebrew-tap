class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.37/tars_0.32.37_darwin_arm64.tar.gz"
      sha256 "c0ef68a1d6e0c6403da3f630b40632d0469182da73a7ff8d522769e990906af1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.37/tars_0.32.37_darwin_amd64.tar.gz"
      sha256 "efb2ccd1eb4f2344107c9992be70bb6f088a3efc2cdf99bd71479cce72eefd4a"
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
