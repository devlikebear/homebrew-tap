class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.53.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.53.0/tars_0.53.0_darwin_arm64.tar.gz"
      sha256 "bda0e97bdf7930ec735fd822039b9557590063b87eb7d5c6ccbdc8727dc5111f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.53.0/tars_0.53.0_darwin_amd64.tar.gz"
      sha256 "01cfc578f26fdc920ad654656dad7e4597e57630128a0c1d2a67d65450bda43a"
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
