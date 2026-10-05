class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.0/tars_0.47.0_darwin_arm64.tar.gz"
      sha256 "aa7665bc1c39ffd66d69d63dd21f0fef4b67b78f6d23141903e5c5b93f5c17f9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.0/tars_0.47.0_darwin_amd64.tar.gz"
      sha256 "426a6d36bce192fa618af94d82817671451f503f1b6b4d8c2ed8b2990d8c0b74"
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
