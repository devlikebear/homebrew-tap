class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.71.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.71.4/tars_0.71.4_darwin_arm64.tar.gz"
      sha256 "e62564ce2eb3679136c5be34eac7141075849aa52a4dc342f96ceac733269c3a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.71.4/tars_0.71.4_darwin_amd64.tar.gz"
      sha256 "477929cb1f02c377eda2642aaa7a514526a0bca2c7f67e0805dd8fe3fd349f72"
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
