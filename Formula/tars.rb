class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.116"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.116/tars_0.31.116_darwin_arm64.tar.gz"
      sha256 "7127942479a0f80e0ee507d8735a33b051dc89841c40be0799caf97fb99849b1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.116/tars_0.31.116_darwin_amd64.tar.gz"
      sha256 "c674fe15d32be5564c7ab3789f87973a1ee5d5a85463fb0e65dd6a3958be8c6e"
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
