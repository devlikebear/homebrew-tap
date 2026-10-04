class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.6/tars_0.45.6_darwin_arm64.tar.gz"
      sha256 "e8872894b8a0b06490698feef6117aed233eb782a4ca917ad1e26847816d5714"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.6/tars_0.45.6_darwin_amd64.tar.gz"
      sha256 "a92e54baac874a972dc3574c82d2be300ab90ad995113d5fbe5b2eb31d2a271c"
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
