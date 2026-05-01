class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.110"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.110/tars_0.31.110_darwin_arm64.tar.gz"
      sha256 "b946625480fe2c7d033254ef0f0909a9c688cb5e15ef9ed7fb382441113252e9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.110/tars_0.31.110_darwin_amd64.tar.gz"
      sha256 "83f3b1633d40d34556bd9d71c34bb45cc60a473646f1a00479d845bf422abaad"
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
