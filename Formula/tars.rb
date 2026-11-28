class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.72.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.72.0/tars_0.72.0_darwin_arm64.tar.gz"
      sha256 "8c7e13a3c0bb5b6baf5932ac8549873f546d8133691e5af3912b0b86b74b6c83"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.72.0/tars_0.72.0_darwin_amd64.tar.gz"
      sha256 "7555c41d1548aa3fdc5e0c512adb6baf9b120402d1c5e0a92448d177017fbc5a"
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
