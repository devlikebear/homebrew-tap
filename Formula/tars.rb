class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.131"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.131/tars_0.31.131_darwin_arm64.tar.gz"
      sha256 "f6315d151fba187ef8626faec2abf17df1b9da94b910abd17de7f78b5e631001"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.131/tars_0.31.131_darwin_amd64.tar.gz"
      sha256 "c2a566bc44af0c3c2aee1036d382e4d531e9c59f9abbba40f27b66d2770ba150"
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
