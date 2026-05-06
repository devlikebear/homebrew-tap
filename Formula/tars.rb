class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.0/tars_0.32.0_darwin_arm64.tar.gz"
      sha256 "10ab841461f0f239ada8f5b3691862b5613a468dc9abe7742034d70131ee99d0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.0/tars_0.32.0_darwin_amd64.tar.gz"
      sha256 "9a0dab79da6b9d6fd13a2006042159494ea652e36411fc7459989a1ad257c4e0"
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
