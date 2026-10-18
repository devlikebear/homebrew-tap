class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.64.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.64.0/tars_0.64.0_darwin_arm64.tar.gz"
      sha256 "3084b399a5f4d92d2305adf1ef51b281fc947464b366e42baefb80a9b7d41bd6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.64.0/tars_0.64.0_darwin_amd64.tar.gz"
      sha256 "f80f2231d7911dd93228d9b4e8b16b89959d3342bb663166c5959c8a1f5bb5a0"
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
