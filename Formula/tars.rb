class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.55.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.55.0/tars_0.55.0_darwin_arm64.tar.gz"
      sha256 "b2192237218a1f8b640fa8175e3614d2ba99b4bdd168e79b15099db14aac9b9e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.55.0/tars_0.55.0_darwin_amd64.tar.gz"
      sha256 "1788ffde4a0db18c988b20aa7e813d4d5865327ed8fac77e1a8e763abd6dc4e0"
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
