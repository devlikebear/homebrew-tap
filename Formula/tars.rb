class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.62.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.62.0/tars_0.62.0_darwin_arm64.tar.gz"
      sha256 "03d3618b80660b9f5f6ab9b093846397d062fc2a50d483ad1370cc8f604e3963"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.62.0/tars_0.62.0_darwin_amd64.tar.gz"
      sha256 "baa156806ba110d7c636dedec8ae8a5b99fa94666fa83451c3f8c74ddba48afd"
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
