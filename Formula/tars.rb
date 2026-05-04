class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.140"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.140/tars_0.31.140_darwin_arm64.tar.gz"
      sha256 "29fe5167c594165fdee05d4a58f31481329dbbb419fe99cc68937d7dea4a026a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.140/tars_0.31.140_darwin_amd64.tar.gz"
      sha256 "d455c1ce6b865d4dd57abb46b365513d642824c65b891e0343fb00d82a4f585c"
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
