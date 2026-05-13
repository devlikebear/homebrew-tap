class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.42/tars_0.32.42_darwin_arm64.tar.gz"
      sha256 "55e49a1d74a2f4456f0517d617cd474115be2f6bd653ce0af89fdd956747c717"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.42/tars_0.32.42_darwin_amd64.tar.gz"
      sha256 "faa9691bea5342f29c86817fe582c432c2cda0cf4f985e3941727ecdc2d2ccab"
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
