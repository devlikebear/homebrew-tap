class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.6/tars_0.47.6_darwin_arm64.tar.gz"
      sha256 "f652d53cd507bc64968f87ce1d495f9a5d7feacd8820265ce5d93eee9b5ebc0b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.6/tars_0.47.6_darwin_amd64.tar.gz"
      sha256 "9016f86cf143e3c5970d47567260c20f93ed426efac9214d6a2909babeda7e2b"
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
