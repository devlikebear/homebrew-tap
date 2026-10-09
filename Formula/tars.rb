class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.58.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.58.0/tars_0.58.0_darwin_arm64.tar.gz"
      sha256 "2001af5ae3fce453de221d6b74b57b1caa376fb477336cf961433341ac283a0b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.58.0/tars_0.58.0_darwin_amd64.tar.gz"
      sha256 "19d4e83936503d6203f8d651a44491069e8ff6402a9cbbdf25b407f3bb44b1fc"
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
