class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.58.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.58.1/tars_0.58.1_darwin_arm64.tar.gz"
      sha256 "e57a081eeee4d6240208304af3648f357d2928b37c4b6b08fc2e68de333e00a9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.58.1/tars_0.58.1_darwin_amd64.tar.gz"
      sha256 "2d2a4fa0f6109ae66b1456966fd8d3d4e20b7b66b7fa95e6ac5ff08ddfbf4260"
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
