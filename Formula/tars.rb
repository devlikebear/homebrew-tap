class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.3/tars_0.45.3_darwin_arm64.tar.gz"
      sha256 "a458a7927eedc3188f4c682091c10ac1c2535ad1359e375b6548d3b9231f5510"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.3/tars_0.45.3_darwin_amd64.tar.gz"
      sha256 "b6bcb24eee0acc362b6a889cb90f40126e03c68f2e037483b132c5def5c0cf00"
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
