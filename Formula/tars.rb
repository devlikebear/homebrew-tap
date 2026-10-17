class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.63.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.63.0/tars_0.63.0_darwin_arm64.tar.gz"
      sha256 "f70b7cd3f048421fc126a3adf1ead67fa0a13d846d1c554c57a47f83133e71c2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.63.0/tars_0.63.0_darwin_amd64.tar.gz"
      sha256 "72d660d7ee510f6ac95ed67001247bca4c23019efc554c3fba96756efc5fa72d"
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
