class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.69"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.69/tars_0.31.69_darwin_arm64.tar.gz"
      sha256 "a1bfa5708e0b92e724c01978b5af6bb77d642fe32e9c47fdab41f7b4014161d9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.69/tars_0.31.69_darwin_amd64.tar.gz"
      sha256 "80c8a4a1298317a655bda07171090933b60850d0b00be67d60b159aec2e32ca0"
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
