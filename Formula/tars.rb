class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.70.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.70.0/tars_0.70.0_darwin_arm64.tar.gz"
      sha256 "689024ae92524dd5d590c2e0dc75e8508ca3fb21c12526f75ebdcdcdb5c032b0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.70.0/tars_0.70.0_darwin_amd64.tar.gz"
      sha256 "5002834237af3f4e12f2d5230e54e07d3d9fb931fe87b35604932601fc114209"
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
