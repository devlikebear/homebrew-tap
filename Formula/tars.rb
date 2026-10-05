class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.46.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.46.2/tars_0.46.2_darwin_arm64.tar.gz"
      sha256 "3f587ec77f69daffd0194a4b37c0a6471164c17d5b7696f56a6ad71999ef84d8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.46.2/tars_0.46.2_darwin_amd64.tar.gz"
      sha256 "13dc8b4789a0863cec61c749aa4cd6990b0e4c166c2573c66cdff3aa5338ccb9"
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
