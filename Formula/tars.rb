class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.36/tars_0.31.36_darwin_arm64.tar.gz"
      sha256 "d9317a845c2ed128abaa2fe8b47b1e3a8ceaa57c6d97a9f898b679e92dc1d03e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.36/tars_0.31.36_darwin_amd64.tar.gz"
      sha256 "27f7a6ae9379100507144a92528a901fd396b56b1227a34aadedcd2f41ddffc9"
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
