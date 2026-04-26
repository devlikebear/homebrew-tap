class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.29.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.29.2/tars_0.29.2_darwin_arm64.tar.gz"
      sha256 "2490cfb0f70be0c139c71a038e0227a737fc0aa914433d7ac8312a224678c47a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.29.2/tars_0.29.2_darwin_amd64.tar.gz"
      sha256 "2982db4b1aac4b349d1cac90dd4f2443e93b9aa6706aff7e63258e674dc641a0"
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
