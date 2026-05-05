class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.180"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.180/tars_0.31.180_darwin_arm64.tar.gz"
      sha256 "69d5a46285c56e8f0f43a2a6d0ac322ff1fe5f7b201427e7c314e9dfe40bdd48"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.180/tars_0.31.180_darwin_amd64.tar.gz"
      sha256 "8db60574047e7d59258aa4660f6f463b79976d131673cd49eac6397deebd0b73"
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
