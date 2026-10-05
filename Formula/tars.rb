class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.3/tars_0.47.3_darwin_arm64.tar.gz"
      sha256 "88187ba7567f29971041a0be256f9b8170e6bc3925451484b99461b6f80d1ab3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.3/tars_0.47.3_darwin_amd64.tar.gz"
      sha256 "d7e32f73143587f9639feb1446ddf9f160b4e07aa1305154a46de4f9adaa94f4"
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
