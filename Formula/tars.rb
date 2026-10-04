class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.4/tars_0.45.4_darwin_arm64.tar.gz"
      sha256 "0fe143dd18caaa395ab893205d34e28184681cc77b5d8390ff99376a71ad7b2a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.4/tars_0.45.4_darwin_amd64.tar.gz"
      sha256 "8014f56a8182b3178b2d6b23610ad1f74f38575a152abecc465aacfde38ca147"
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
