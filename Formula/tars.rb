class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.2/tars_0.45.2_darwin_arm64.tar.gz"
      sha256 "6800d7f77dc126ebc1453d7f8da9ea632ac07db03405e91da73739b57c81d4b2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.2/tars_0.45.2_darwin_amd64.tar.gz"
      sha256 "de8f60d1e158e3eb64583cca4441bda7e2dfb46145c0afc497767c4dfdc61d86"
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
