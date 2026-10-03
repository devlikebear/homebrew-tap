class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.44.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.44.3/tars_0.44.3_darwin_arm64.tar.gz"
      sha256 "9ed8b7c77527cbc8fdc5567e235421550e1e23a9b9101f8853f3bfb8518988fa"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.44.3/tars_0.44.3_darwin_amd64.tar.gz"
      sha256 "251fdf050fbe9484fa48f5ac176a01510d68cdb6000d13f46c5b391d8abf74e5"
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
