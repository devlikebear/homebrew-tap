class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.29/tars_0.31.29_darwin_arm64.tar.gz"
      sha256 "4fe2253523847b0a2166309bc449581553c1c19444f2dcd973d379b766083efb"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.29/tars_0.31.29_darwin_amd64.tar.gz"
      sha256 "f0c770b7f3c5f293dfb704a81bc90b65d6f5fa36a1d5e98f353fb6a0d080b690"
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
