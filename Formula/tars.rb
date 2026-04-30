class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.44"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.44/tars_0.31.44_darwin_arm64.tar.gz"
      sha256 "e6740bb583e9d15c05cbaa9e29e67d4ad0e19f128067fd81d9ebdb05f46d77a5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.44/tars_0.31.44_darwin_amd64.tar.gz"
      sha256 "2843e5367c8759fdf332b547ffc8f4156f24ed4f4f14bf031567350835bf144d"
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
