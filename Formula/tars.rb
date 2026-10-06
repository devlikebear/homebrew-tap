class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.49.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.49.1/tars_0.49.1_darwin_arm64.tar.gz"
      sha256 "3d39a8237113433dd9d2a1bc55006ccedff9360e3e318e0dbe23523b89c5a29f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.49.1/tars_0.49.1_darwin_amd64.tar.gz"
      sha256 "ad2cb6e98fff6fec51ebc21a712c68180f0ac82df3652b9666c56828d5ab43f2"
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
