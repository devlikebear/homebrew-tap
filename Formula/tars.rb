class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.30.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.30.0/tars_0.30.0_darwin_arm64.tar.gz"
      sha256 "561aad8bfcc563d008f5e834903062ba66967e6c815ecb5b1a2e1e64c937a73a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.30.0/tars_0.30.0_darwin_amd64.tar.gz"
      sha256 "ad16b4fa4211d1e65071d84ca1ec9e020620feecddaf5211039588140c42ec0b"
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
