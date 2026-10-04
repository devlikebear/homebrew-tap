class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.8/tars_0.45.8_darwin_arm64.tar.gz"
      sha256 "7f11c9af65cbf6a2a294198fdbb8d2a80ac7d39206ed07de0643b9cae8df7d6a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.8/tars_0.45.8_darwin_amd64.tar.gz"
      sha256 "d4c64bf6450afd9b9c61b98f2805f1867f8a56aac81fe7d3e988896bff8dc43a"
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
