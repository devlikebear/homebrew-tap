class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.66.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.66.1/tars_0.66.1_darwin_arm64.tar.gz"
      sha256 "83c8600be7c2850f3dc3391b2b5e951e77ef745fb6e2c3c9c581c07d7a676dd2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.66.1/tars_0.66.1_darwin_amd64.tar.gz"
      sha256 "37f90ab42f8736c10923a377f5cf574e9daf0d124dc049c6f1f97a14e62c8134"
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

      This formula is the command-line install. The desktop app (tray,
      approval notifications, its own window) ships its own tars, so with
      it you do not need this formula:
        brew install --cask devlikebear/tap/tars-desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
