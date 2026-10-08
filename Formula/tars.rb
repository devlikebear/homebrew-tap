class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.54.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.54.0/tars_0.54.0_darwin_arm64.tar.gz"
      sha256 "e8e9f255b28e30a08a72891d3afbc6a45e2b74b43ae3c94cf47c749ff95a05c2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.54.0/tars_0.54.0_darwin_amd64.tar.gz"
      sha256 "6044d0f19a1afd88dbe9a9ee7e4e330327d02ae024a53408d60704c394c045f3"
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
