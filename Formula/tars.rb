class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.105"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.105/tars_0.31.105_darwin_arm64.tar.gz"
      sha256 "da8b64ee38eeda8d32ebec6dd2b440634cc14815cf411e9628cefff608248144"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.105/tars_0.31.105_darwin_amd64.tar.gz"
      sha256 "2f6393fc8ee8cc7538b31c73c069672cac4754ddf0c2ecc64056e3c7d92967a8"
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
