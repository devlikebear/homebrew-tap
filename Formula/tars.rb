class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.7.0/tars_0.7.0_darwin_arm64.tar.gz"
      sha256 "206c0272a6783d815da6360a769c82ef2002b27e6076ff052459a07681879922"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.7.0/tars_0.7.0_darwin_amd64.tar.gz"
      sha256 "f412ba0a2308c5aef0384c9d02b95104f0a0d2637035cbc67255f80cc230368c"
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
