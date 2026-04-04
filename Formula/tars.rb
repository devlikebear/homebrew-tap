class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.15.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.15.2/tars_0.15.2_darwin_arm64.tar.gz"
      sha256 "ac05445129780d6fe6bd999400146df944e7590c8022e54d22480e3102141a86"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.15.2/tars_0.15.2_darwin_amd64.tar.gz"
      sha256 "45c07159fd9965bef8b2b06cf8b71377188429a8ff483cb76ecf169f2bc43f3b"
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
