class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.65.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.65.0/tars_0.65.0_darwin_arm64.tar.gz"
      sha256 "ff8750dea61db1fa7c41afac7a27a35a21c1a1e1ab4f29b3756c026b0d3fe69c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.65.0/tars_0.65.0_darwin_amd64.tar.gz"
      sha256 "4e37c9a2360325b9fb03da674e5da464afdbb92735beed33a95febfb8015e84a"
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
