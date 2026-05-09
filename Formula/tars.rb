class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.19/tars_0.32.19_darwin_arm64.tar.gz"
      sha256 "37d666ed51992ee165904dae109467def372f07da6a30d7968b629cf0e26adbc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.19/tars_0.32.19_darwin_amd64.tar.gz"
      sha256 "2e6f137361fa25aace8428276ef0998dc9abfe50a7903b50236d1ada46118859"
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
