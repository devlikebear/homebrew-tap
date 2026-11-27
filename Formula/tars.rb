class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.71.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.71.2/tars_0.71.2_darwin_arm64.tar.gz"
      sha256 "1f998a03fab95ccd895c772a4bd99fecbf0a3898a0792b5e125916112280aaed"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.71.2/tars_0.71.2_darwin_amd64.tar.gz"
      sha256 "32acfb9ccb30fd2de208b8d09490236539aa7c6d7b630791dbb34881ba596965"
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
