class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.56.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.56.0/tars_0.56.0_darwin_arm64.tar.gz"
      sha256 "403c759e1fa85ed416a008bdef3bc3f7befec363e36fca712dc5f6abe7b68ed9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.56.0/tars_0.56.0_darwin_amd64.tar.gz"
      sha256 "7051608eee18994aff9435bce8858d8d2bc85ecd95776f8188dcf47f93c4cb25"
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
