class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.32/tars_0.31.32_darwin_arm64.tar.gz"
      sha256 "51927498f99d39d12f868eb5976caa21205d356479cd77b4c14ef3f3ec8f569d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.32/tars_0.31.32_darwin_amd64.tar.gz"
      sha256 "4ed8f00530776b1c68d2490d8c092d3b6d1de2cdcc7c39fe850022f77a768304"
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
