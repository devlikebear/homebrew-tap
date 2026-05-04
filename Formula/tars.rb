class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.144"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.144/tars_0.31.144_darwin_arm64.tar.gz"
      sha256 "7140fc6afdb1d62ed41f7316e042eec5fcf0f05a026d27e9365eea22af7048d1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.144/tars_0.31.144_darwin_amd64.tar.gz"
      sha256 "dd03178e2073a699289e92affd7ede82ac5697e145d11a0702c1001d9c397c0d"
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
