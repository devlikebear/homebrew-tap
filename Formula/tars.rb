class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.26.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.26.1/tars_0.26.1_darwin_arm64.tar.gz"
      sha256 "e6d1816d6a999535c23b933918f05840f08aa08ec94cdaff4bf4d8c2afa40187"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.26.1/tars_0.26.1_darwin_amd64.tar.gz"
      sha256 "c7013b6eaba6a3e9812783dce603c6481bfea6196cab45738998772179e39c26"
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
