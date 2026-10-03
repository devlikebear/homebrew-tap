class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.43.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.43.4/tars_0.43.4_darwin_arm64.tar.gz"
      sha256 "7f108caeff21d4121be24fb5423da89a0e1ebdf02e0618d7e99b2a3c012c707b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.43.4/tars_0.43.4_darwin_amd64.tar.gz"
      sha256 "03270b58a30f0c5a335a20628594293cb8b3cfbfb785cde2ed75073bfae04ef4"
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
