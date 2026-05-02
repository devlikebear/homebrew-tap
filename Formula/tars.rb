class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.128"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.128/tars_0.31.128_darwin_arm64.tar.gz"
      sha256 "fee748390262812e353870558b6aa92284e064f4ed82118f647ba45880237ecb"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.128/tars_0.31.128_darwin_amd64.tar.gz"
      sha256 "dd835b4f7fd14820c8262976ef2a5e94be7dbd9cd3461c46957d04b23ebab474"
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
