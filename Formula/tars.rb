class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.2/tars_0.47.2_darwin_arm64.tar.gz"
      sha256 "b6fd7342ae8c4eec6d948534fd9828b137f9c8c3b74e429d1038e02a8e9b73b6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.2/tars_0.47.2_darwin_amd64.tar.gz"
      sha256 "a1aaa4e313fe280a611016267555657cc0c56c2df5794f62f819e934291acb18"
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
