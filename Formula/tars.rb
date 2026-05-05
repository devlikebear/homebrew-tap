class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.168"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.168/tars_0.31.168_darwin_arm64.tar.gz"
      sha256 "a1fa1253ac3f7fcf7dc60b73b51a77fef398c77409d487c44d5e023bb79f608e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.168/tars_0.31.168_darwin_amd64.tar.gz"
      sha256 "5c9d7cbad2e86918599aaaa8d79adad2bb096163f87989e5f9bad9ce1fb51254"
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
