class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.78"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.78/tars_0.31.78_darwin_arm64.tar.gz"
      sha256 "87313d5cdc6ea89f26529accd4b2e32ad31b8fdc020729cabb26020ede4517d8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.78/tars_0.31.78_darwin_amd64.tar.gz"
      sha256 "12e7212a430f0f9c3460be71debb95e40e017f14fa25eb8be5cb2c9fade2b827"
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
