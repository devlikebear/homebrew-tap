class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.57"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.57/tars_0.32.57_darwin_arm64.tar.gz"
      sha256 "36be2b16f23d0cb28b416b4eee67a0e6c5d1d26219e496f5c83d7946ae2037f5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.57/tars_0.32.57_darwin_amd64.tar.gz"
      sha256 "deb16aca4bcdf8894e3ff5d7c899320afe23753eaa9387783cb0187a52f69c2d"
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
