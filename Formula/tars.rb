class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.28.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.28.1/tars_0.28.1_darwin_arm64.tar.gz"
      sha256 "f0b9341aa8dcb59da53aa654d268b2867c0ce8e48445e2fa33f46ea302e36f60"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.28.1/tars_0.28.1_darwin_amd64.tar.gz"
      sha256 "84951cee7b15f3dbf6e8c84815a04692a5dbe45f33f483e58685e0863421bbb9"
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
