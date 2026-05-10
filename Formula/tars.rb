class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.30/tars_0.32.30_darwin_arm64.tar.gz"
      sha256 "8031bf5c8e044504aa0bea1dcdada060d6509042fc67142c43902d0525bb6fd8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.30/tars_0.32.30_darwin_amd64.tar.gz"
      sha256 "acb4cfa0ed9613e5b72bc14fc47218bba9a69c2749aecb38ecc017f36264d781"
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
