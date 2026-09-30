class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.38.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.38.0/tars_0.38.0_darwin_arm64.tar.gz"
      sha256 "08ef3268237bc6abd92b0e3312d62308a496c21fe3ab93228e9230736a220b32"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.38.0/tars_0.38.0_darwin_amd64.tar.gz"
      sha256 "6e5a7105bd6892ca7dbcc474964d33f3badd38a1f81d825414d3a436a4177eca"
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
