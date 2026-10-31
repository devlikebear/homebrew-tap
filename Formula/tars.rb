class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.67.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.67.0/tars_0.67.0_darwin_arm64.tar.gz"
      sha256 "3a57f71dca17b8f2a73416f5c85ac6f9a18654ee7f3a8a9fa383f67e4d7d5ae3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.67.0/tars_0.67.0_darwin_amd64.tar.gz"
      sha256 "d1942f20620f2841f90bacfe36e8c75f3a2d6479ab7b16ca854aa6f628a56caf"
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
