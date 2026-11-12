class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.68.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.68.0/tars_0.68.0_darwin_arm64.tar.gz"
      sha256 "ac7f6a8bfb130fb342abc16c63e86ce03e4a98ecb830c4087120cff19e0c6892"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.68.0/tars_0.68.0_darwin_amd64.tar.gz"
      sha256 "40ee4824cf6cdfc5cfe280c3b1fde9669d13538c76846901a53a841da211875e"
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
