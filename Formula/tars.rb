class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.106"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.106/tars_0.31.106_darwin_arm64.tar.gz"
      sha256 "52007b270d2ac2ca9a8d943b748d1089d249ad6844ada6ca33913b1398592465"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.106/tars_0.31.106_darwin_amd64.tar.gz"
      sha256 "b729cc98017115b3b1558b9ef3bec22ca5aac38cb5b7c047336ab8a0b77868b2"
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
