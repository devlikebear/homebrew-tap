class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.42.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.42.1/tars_0.42.1_darwin_arm64.tar.gz"
      sha256 "edcdec755c530b7169ddebc6440a7685629480db9ebed697133e6a6ab13123ef"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.42.1/tars_0.42.1_darwin_amd64.tar.gz"
      sha256 "7f556894e28d0357f5320e1a9e80ef5dd545ff8e3835940de3df5283c0985f04"
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
