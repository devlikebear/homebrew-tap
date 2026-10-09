class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.59.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.59.0/tars_0.59.0_darwin_arm64.tar.gz"
      sha256 "e90eacd1957fbbac0c2071b42f8fbde5d9b5ffe9481e6b9d23bbdb06cad2fabb"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.59.0/tars_0.59.0_darwin_amd64.tar.gz"
      sha256 "4b30c2a7f4f7a682c8338faa1b2bc861da6e5f4d109e1c17fb5230cb67672b28"
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
