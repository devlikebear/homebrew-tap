class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.10/tars_0.31.10_darwin_arm64.tar.gz"
      sha256 "a558baecb55c6f592b2d240ba9bc16e3311a9bc22e371a74c5ef6e113f86c7ca"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.10/tars_0.31.10_darwin_amd64.tar.gz"
      sha256 "983606ee98b9be7f74316690274ac800d430440446cdf9c5745d3c6a5fe9183b"
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
