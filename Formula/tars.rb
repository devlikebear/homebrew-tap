class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.43.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.43.0/tars_0.43.0_darwin_arm64.tar.gz"
      sha256 "f621e39b99ab70dab426e10e7d7d75cf0bed70372abf1f6281815570be523c76"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.43.0/tars_0.43.0_darwin_amd64.tar.gz"
      sha256 "d24f4c67cfa58c7b0f0e1d2379b3d360463013d85e73e53664697f83d02df59d"
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
