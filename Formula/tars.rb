class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.68"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.68/tars_0.31.68_darwin_arm64.tar.gz"
      sha256 "52493fa5d681349fd5a181ed78b703c773919320521c19aabcd70ced1f11a7a6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.68/tars_0.31.68_darwin_amd64.tar.gz"
      sha256 "f485522de85b242f374986f20f1b9ca5514309569524fa7929a46a780bbcff2e"
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
