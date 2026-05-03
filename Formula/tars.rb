class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.135"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.135/tars_0.31.135_darwin_arm64.tar.gz"
      sha256 "3a244eeb47859c7b719e604201289b304bce6b6ca234f22d6ff1fb767ae33b0b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.135/tars_0.31.135_darwin_amd64.tar.gz"
      sha256 "95a6755b2ad344de8c6eb8b848a0224469e582034b1226003d6cf500cab08a4c"
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
