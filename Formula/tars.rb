class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.44.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.44.0/tars_0.44.0_darwin_arm64.tar.gz"
      sha256 "b0d8ba2715876265193282a8210436a5afc4c2d4eb37817c250e22d11245a5d7"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.44.0/tars_0.44.0_darwin_amd64.tar.gz"
      sha256 "4c75f3cd3190c2f8a858960895e621bf7ca48bc3ef808ef544cfd7d35c82d90f"
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
