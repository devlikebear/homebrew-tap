class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.44.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.44.1/tars_0.44.1_darwin_arm64.tar.gz"
      sha256 "37c589f5f2388e9ef2c047b575c3dc8d5beeb96922648e0d0dcf1aba14ffb1f5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.44.1/tars_0.44.1_darwin_amd64.tar.gz"
      sha256 "d83790adc38717c278ea7ed7cf4fd6d6aa887e9f7e179ea294b8adce851cf515"
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
