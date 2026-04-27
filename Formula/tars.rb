class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.17/tars_0.31.17_darwin_arm64.tar.gz"
      sha256 "96e4bf30e42ecabcd7fde1b7ccd87f4f2735fd91180b1fb9b54349c1e881c88e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.17/tars_0.31.17_darwin_amd64.tar.gz"
      sha256 "312d9f1572bbfcdcc97eadb69065d5ca0c5eff92ece0bb0cd13403ce8f6b8cec"
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
