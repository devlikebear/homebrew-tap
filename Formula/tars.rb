class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.52.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.52.0/tars_0.52.0_darwin_arm64.tar.gz"
      sha256 "96cff00dd5ca0961593601dad7f28d16cdc584edc18eefa902db0491d0637ca5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.52.0/tars_0.52.0_darwin_amd64.tar.gz"
      sha256 "ed99694ff06037421c5d7cc26103d9308fa5fae7e7d0d00ec90b8380b6c05bd7"
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
