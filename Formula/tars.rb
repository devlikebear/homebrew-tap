class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.66.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.66.0/tars_0.66.0_darwin_arm64.tar.gz"
      sha256 "1d6ae15d07bf73ad7e037c9206593e7c2a82f0f5ed3d7c017653289c4d4a1deb"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.66.0/tars_0.66.0_darwin_amd64.tar.gz"
      sha256 "e8c4aeb4825b2b0e6f42d5f62bb74a87186e76e8f7bc841d2652fa7c04f675e8"
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
