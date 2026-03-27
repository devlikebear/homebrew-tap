class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.12.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.12.1/tars_0.12.1_darwin_arm64.tar.gz"
      sha256 "5f8ae065c1a870429ccc538523b18117d5d4ae5efa079c476114e908d9dcbbd9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.12.1/tars_0.12.1_darwin_amd64.tar.gz"
      sha256 "26a50fd8a7e17f7c31f3702b0bab271d9ed5b4892cbc2b2a05dcb3c07854319f"
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
