class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.71.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.71.3/tars_0.71.3_darwin_arm64.tar.gz"
      sha256 "a257e1caeec08b34a8814857a5af20fe62fbb7df06eb1f36c9f7737eb739df26"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.71.3/tars_0.71.3_darwin_amd64.tar.gz"
      sha256 "f28a6237eadcc2aed3e5b9712f9037ae2acd630d752132fa0751f973e77d694f"
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
