class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.100"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.100/tars_0.31.100_darwin_arm64.tar.gz"
      sha256 "9377a999c1a3a738b7bf6320ce6a8f94f18a091906957958aee2bf4d40cc3d4b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.100/tars_0.31.100_darwin_amd64.tar.gz"
      sha256 "ebc84b3c831550255dfb0cd0252619ebd42263e8bed5c89102b00485a83e93fc"
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
