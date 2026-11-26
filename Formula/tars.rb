class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.71.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.71.1/tars_0.71.1_darwin_arm64.tar.gz"
      sha256 "4f8dbd1236933ef9670fd8a2f7c6d054fd1fee8e7c0986c075f569bf14b57d65"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.71.1/tars_0.71.1_darwin_amd64.tar.gz"
      sha256 "776b3dd782210457aa29d1502b278595ab0808b72c6a4eaea26b75a1aebbb14d"
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

      This formula is the command-line install. The desktop app (tray,
      approval notifications, its own window) ships its own tars, so with
      it you do not need this formula:
        brew install --cask devlikebear/tap/tars-desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
