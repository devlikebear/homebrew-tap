class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.5/tars_0.47.5_darwin_arm64.tar.gz"
      sha256 "2be301f8941d8804bbe17ac3f62c3056086e30b2ec08bdc89cf25b04f52bca4f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.5/tars_0.47.5_darwin_amd64.tar.gz"
      sha256 "7678ce76b16a9b1da4e17e50a8a176493c4fdace28298703c0a48960f6bbbf75"
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
