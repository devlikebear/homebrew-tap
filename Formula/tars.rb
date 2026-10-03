class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.0/tars_0.45.0_darwin_arm64.tar.gz"
      sha256 "7d96445a5bd855c561fbb9818bcf2e7b676036ccb5a99019f4262e0b95f23b4a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.0/tars_0.45.0_darwin_amd64.tar.gz"
      sha256 "64411ab77c329911df47fe384051138d2ba5041bebe937d909ddb06067c57c24"
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
