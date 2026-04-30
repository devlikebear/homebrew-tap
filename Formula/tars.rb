class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.41"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.41/tars_0.31.41_darwin_arm64.tar.gz"
      sha256 "900e6274a70c4901889e2ea64235305dc2735b50d435c3c8d4a9fc553c43e04c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.41/tars_0.31.41_darwin_amd64.tar.gz"
      sha256 "2da03f114ec978f69dfd69df1a1d0a4b1fdcdfa30570fe049346531bc5192025"
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
