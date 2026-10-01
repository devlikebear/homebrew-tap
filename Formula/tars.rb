class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.42.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.42.2/tars_0.42.2_darwin_arm64.tar.gz"
      sha256 "1350ff422fa976c084aa8ba9dd756cce143c049416c53f0e7874218fded30be3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.42.2/tars_0.42.2_darwin_amd64.tar.gz"
      sha256 "124739232dcf5e6ad11d96e891d12db79e921b86becc1c4bc6f878b5f7bea7e8"
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
