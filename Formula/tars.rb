class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.71.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.71.0/tars_0.71.0_darwin_arm64.tar.gz"
      sha256 "6902da5ff1e93b64367cebceee7e676875127338d97215d7be06b8b6612c8e5d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.71.0/tars_0.71.0_darwin_amd64.tar.gz"
      sha256 "1c6cd1441305f7c4c456c55527901cd26f87350ee20541e1c1c016e010eef4f7"
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
