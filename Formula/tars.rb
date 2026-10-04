class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.5/tars_0.45.5_darwin_arm64.tar.gz"
      sha256 "ffbb28e867ebfde520609aa1639c3db315a58263eb83662b0fbe0708ab68e2c6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.5/tars_0.45.5_darwin_amd64.tar.gz"
      sha256 "ced6125522ad7bb3d07f7dc403fca52c03dbfae61cd315a97fc61f4e9164e7a3"
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
