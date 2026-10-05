class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.46.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.46.1/tars_0.46.1_darwin_arm64.tar.gz"
      sha256 "c4534c52ec2d80f4e28906b72138e1e93318f9b03730b6d5d7e16c7f6f769d52"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.46.1/tars_0.46.1_darwin_amd64.tar.gz"
      sha256 "480ad9657267b564ab1e3445d385c5131012e8478f2023a70c3fb315e389d8a0"
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
