class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.51"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.51/tars_0.31.51_darwin_arm64.tar.gz"
      sha256 "4838fc44054585f670d1802ee0d01540db5f19104b06c2937290432bc3b30e95"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.51/tars_0.31.51_darwin_amd64.tar.gz"
      sha256 "86336e24b316912e2165191f725949be2d4e7d04cf55f1bbb6983358acbda341"
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
