class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.19/tars_0.31.19_darwin_arm64.tar.gz"
      sha256 "ced081831d1bb09b5afd989d2987f26b83f2c8f0976d8b2cf0aac854c5be782e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.19/tars_0.31.19_darwin_amd64.tar.gz"
      sha256 "60d00465a5ce10277a0870c23af474be9c3aefcc33b0a39310ca93d4144b646b"
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
