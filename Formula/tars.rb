class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.84"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.84/tars_0.31.84_darwin_arm64.tar.gz"
      sha256 "ec8a8ee053a627b09e061705627164dd37aff309e640a47acbdef53646fdb472"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.84/tars_0.31.84_darwin_amd64.tar.gz"
      sha256 "42761e0b9ca8ceb731ce3024decf212661ad3740a0bc8f7a325586c489f2828e"
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
