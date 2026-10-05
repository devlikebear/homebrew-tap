class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.1/tars_0.47.1_darwin_arm64.tar.gz"
      sha256 "7734608620eefd742431bc04327a5882bcfb33069cb83370e2ea0d6eb99b8c50"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.1/tars_0.47.1_darwin_amd64.tar.gz"
      sha256 "1b804682a5c94abacf926d2b2ae37635386a67a3eb586e58b4fc29aa5b20ed20"
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
