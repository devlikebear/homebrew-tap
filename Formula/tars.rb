class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.57.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.57.0/tars_0.57.0_darwin_arm64.tar.gz"
      sha256 "24010829f09c25c950d265471525d8d263b8009763413fc7ab3c78a4a6309d01"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.57.0/tars_0.57.0_darwin_amd64.tar.gz"
      sha256 "7732e74510df32808187b6425a6857a81f845ca907c833faf019d7445aa6ade3"
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
