class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.60.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.60.0/tars_0.60.0_darwin_arm64.tar.gz"
      sha256 "033b1420ba12c77b8c30be09f0f9aa56aa83b536cd4673dc720c2b3a03836460"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.60.0/tars_0.60.0_darwin_amd64.tar.gz"
      sha256 "05595d7ed8cebc780c219c2adc120c8f7818c99f1abfa407ddcc8a0c9c34cb76"
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
