class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.154"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.154/tars_0.31.154_darwin_arm64.tar.gz"
      sha256 "bece7920c97226b8349eaab8e6c2fb4e879c161f8640b563c774dded2f6e3306"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.154/tars_0.31.154_darwin_amd64.tar.gz"
      sha256 "d8a1c49557250b75afb17ccb34a997dedf9cde73ffb9b814719b882c8ea8b4d3"
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
