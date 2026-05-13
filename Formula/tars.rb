class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.43/tars_0.32.43_darwin_arm64.tar.gz"
      sha256 "3c30de07cf231403e9f2f22179d8f624663e1db9fe1ee15427bd8182f20c0361"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.43/tars_0.32.43_darwin_amd64.tar.gz"
      sha256 "08ae321f0b39226a2aac9769594daeff8435c62e4c1f0bfff18a683a44796d64"
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
