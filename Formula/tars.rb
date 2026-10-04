class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.9/tars_0.45.9_darwin_arm64.tar.gz"
      sha256 "1feaa9522fdef40078f0f26370c8591740e913785c7f8fe38b2bb53dff16b35e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.9/tars_0.45.9_darwin_amd64.tar.gz"
      sha256 "0f703380cebdd6f790554e1c8350e0fa6918ee4c08bf378ab97c9f2ff0e70661"
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
