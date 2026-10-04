class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.46.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.46.0/tars_0.46.0_darwin_arm64.tar.gz"
      sha256 "52f94237995df457852c0e210e2655801d89a80e4d251c6f7dc8303f0af58994"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.46.0/tars_0.46.0_darwin_amd64.tar.gz"
      sha256 "53cab847d4775be4cc53f213cbde62a24fd10507b11eee8ef027c6fbdc144112"
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
