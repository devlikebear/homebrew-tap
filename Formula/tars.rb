class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.35/tars_0.31.35_darwin_arm64.tar.gz"
      sha256 "f4c3c20749722fc14877d7c7524fb439295c936deeba48980c4f6a35b07f437e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.35/tars_0.31.35_darwin_amd64.tar.gz"
      sha256 "3159548c7ae1009ecfd962dcca5cf37e489abad7df3bceb9dd76c99cc9d7a7e0"
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
