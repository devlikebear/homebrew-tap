class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.77"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.77/tars_0.31.77_darwin_arm64.tar.gz"
      sha256 "9656c019d1e2171be9f57225290913d889e4b8f697453846f642eab8dd422a1f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.77/tars_0.31.77_darwin_amd64.tar.gz"
      sha256 "3867dad942aa80881fc1babf47a5476fb7133d4ebee98542d7d9a21808f1b832"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
