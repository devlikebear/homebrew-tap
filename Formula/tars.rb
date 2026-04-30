class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.53"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.53/tars_0.31.53_darwin_arm64.tar.gz"
      sha256 "1da8f4a96f0bb9388ed62b62f3fd9f8085f8ced309be4ee5e35b6cba7526ef60"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.53/tars_0.31.53_darwin_amd64.tar.gz"
      sha256 "5437a1f72357faff8ff5278d4f4a333aa9dbe0427655a3997783c8161bfc4aa9"
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
