class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.8/tars_0.32.8_darwin_arm64.tar.gz"
      sha256 "5731163f0fa4710f6b8b7b9466955dfa77283e8924b7a23c13f6d96e7eee51d4"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.8/tars_0.32.8_darwin_amd64.tar.gz"
      sha256 "3c9c0a947e515c6bc4add0b68a21b8113432d5425db692834d0577b59af7650a"
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
