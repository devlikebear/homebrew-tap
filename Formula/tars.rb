class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.7/tars_0.47.7_darwin_arm64.tar.gz"
      sha256 "971617f8bd513d3e4d3fdcbe0e3a193d5da4378d13036eff308c93d1f0c2e8a7"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.7/tars_0.47.7_darwin_amd64.tar.gz"
      sha256 "020731120d3765ef63acffee4440f4773c76be10c0749507c626b6da4199da05"
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
