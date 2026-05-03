class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.134"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.134/tars_0.31.134_darwin_arm64.tar.gz"
      sha256 "44bb1d9e0b28365b440008f2ea91a1d12ec8d8e67d3a9c573d6c22da637b87b3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.134/tars_0.31.134_darwin_amd64.tar.gz"
      sha256 "1d3c873316e8fe3a682000e76d4b47bc8439c0cc525469acdee2ca51ad917adf"
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
