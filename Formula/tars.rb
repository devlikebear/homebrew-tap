class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.61.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.61.0/tars_0.61.0_darwin_arm64.tar.gz"
      sha256 "a3e15cdaf8dc3599f3038428878133224dd509d3e2d55cdb3438bc8b36b162ac"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.61.0/tars_0.61.0_darwin_amd64.tar.gz"
      sha256 "4bead5d80d866e773ec6c015dc9713ed7bb061e1c6ad77524a0a73d49bc1bc45"
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
