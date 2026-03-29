class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.14.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.14.2/tars_0.14.2_darwin_arm64.tar.gz"
      sha256 "14b3123055391f0a12749ca0cedeec4194595052bf3d62e2b2f2f25ff1bbfcec"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.14.2/tars_0.14.2_darwin_amd64.tar.gz"
      sha256 "f3b7b16f889fe06ac38529a4c085920e4635a8fed71ab672356918d61380698b"
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
