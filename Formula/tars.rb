class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.54/tars_0.32.54_darwin_arm64.tar.gz"
      sha256 "0dbb597bf7e0cf79cfab3cf9793e8212034d3449bae37b072a23ce1cc1cf4740"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.54/tars_0.32.54_darwin_amd64.tar.gz"
      sha256 "0d36795628669a742ba7ee02abbd2917d7793c8d6f20ba4bef2e4c72027f4afa"
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
