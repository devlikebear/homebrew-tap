class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.6.2/tars_0.6.2_darwin_arm64.tar.gz"
      sha256 "647f33b4dd3a717272950849e00cee432b0d20aa74fe85d0dfed813b4f6a8a0b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.6.2/tars_0.6.2_darwin_amd64.tar.gz"
      sha256 "96b31fbd637e853ba2dc56b5815e156dcfe21a721f779fb7e7fbc643d322b72c"
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
