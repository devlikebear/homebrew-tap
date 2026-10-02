class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.43.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.43.3/tars_0.43.3_darwin_arm64.tar.gz"
      sha256 "9a70e52a40866c5af3ba48d1d0ffabe0c7a873eec985bc4fd2e66affcd66b3cd"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.43.3/tars_0.43.3_darwin_amd64.tar.gz"
      sha256 "65e88550bde758c4c9a48178ac22db71ec4a313a492e15c62e6e22ac9519f00d"
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
