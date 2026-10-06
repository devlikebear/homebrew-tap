class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.51.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.51.0/tars_0.51.0_darwin_arm64.tar.gz"
      sha256 "74bbf4927b7c3a6a1576cb672cdf911654ed1e30c0d8a1e54b21f19f12dc3bf0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.51.0/tars_0.51.0_darwin_amd64.tar.gz"
      sha256 "c165daba4a7590947d6cf80b707d189c8bb9b32716f9508b7fc525592bf7d8df"
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
