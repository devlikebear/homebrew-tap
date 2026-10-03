class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.44.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.44.2/tars_0.44.2_darwin_arm64.tar.gz"
      sha256 "6cf1084d513ac528e9d0aa3bb6865673fbcd2f8844d4f9e0ce79fd1ea544da0d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.44.2/tars_0.44.2_darwin_amd64.tar.gz"
      sha256 "00c27c187bbc68ea8fb5d799c522bd27332de16d0d8b17896d56932a0b337b42"
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

      For the desktop app (tray, approval notifications, its own window):
        brew install --cask devlikebear/tap/tars-desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
