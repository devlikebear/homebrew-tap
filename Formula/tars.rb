class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.49.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.49.0/tars_0.49.0_darwin_arm64.tar.gz"
      sha256 "4be79cd9f3015aaa70f8b5ec7dbf20e0fdfff8ab745cc81f6c98e88ffe3bec2b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.49.0/tars_0.49.0_darwin_amd64.tar.gz"
      sha256 "fbac9715cf65faf0f5776d44304c9845d426535e51282cd61938b25705d977bf"
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
