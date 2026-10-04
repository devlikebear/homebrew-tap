class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.1/tars_0.45.1_darwin_arm64.tar.gz"
      sha256 "506e603b201df6ed559d505cc3cdee3ce8b11e8b21939ec3b6cfe5306b9c6a9d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.1/tars_0.45.1_darwin_amd64.tar.gz"
      sha256 "f10fd7b9c0a954fa5222736c7efb76f24b2d307a7c49919d79937c9a0327f0a3"
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
