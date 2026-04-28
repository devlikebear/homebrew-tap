class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.24/tars_0.31.24_darwin_arm64.tar.gz"
      sha256 "e1f5937144b5cf92d330d9a89d134a38ccb34d1fee10fe247f500868fa92b906"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.24/tars_0.31.24_darwin_amd64.tar.gz"
      sha256 "c399d8ef96e8b3958aa3401128f9bf7c39232ff0ef5956877fabae8bb46ef2bf"
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
