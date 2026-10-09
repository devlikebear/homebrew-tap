class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.57.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.57.1/tars_0.57.1_darwin_arm64.tar.gz"
      sha256 "2639be2f1a39975a2f87125b7f45303715893c885487a172998849fe6ccd9e18"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.57.1/tars_0.57.1_darwin_amd64.tar.gz"
      sha256 "d579b86d43feccfd71977daa08837972b39b9934d325ec9e90eb4869c6bef018"
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
