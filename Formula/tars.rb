class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.66"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.66/tars_0.32.66_darwin_arm64.tar.gz"
      sha256 "c05faedb4b1589bfe174719b25fa5c23b304ee2367ca582ccb936c1439deccde"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.66/tars_0.32.66_darwin_amd64.tar.gz"
      sha256 "1c3d3a5d01d41a61e29c9ff89ad3cbf10affc878aa6a0834d4cfa206e4d3a79f"
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
