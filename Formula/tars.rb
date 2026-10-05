class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.48.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.48.0/tars_0.48.0_darwin_arm64.tar.gz"
      sha256 "28811899059f6f55003e0e1de872c74d444bf2c71c63c9fd6f7a30d2c7c04f51"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.48.0/tars_0.48.0_darwin_amd64.tar.gz"
      sha256 "4082eb22a649a00fde418fc2193ad05dfced70de424e536aa8e8cf236251a1cb"
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
