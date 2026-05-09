class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.11/tars_0.32.11_darwin_arm64.tar.gz"
      sha256 "ccde94d5e581d19747b06bd4a49467559201d7cdf62eee54f9f7cabcf9c78bf2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.11/tars_0.32.11_darwin_amd64.tar.gz"
      sha256 "61be05deae71d4421398a3e2e00bd066d99d26e611b95f77ed9a49316d14e63e"
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
