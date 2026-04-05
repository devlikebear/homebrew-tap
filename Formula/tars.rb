class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.24.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.24.0/tars_0.24.0_darwin_arm64.tar.gz"
      sha256 "617ae6759511c635b323566cbd493d5416ee1638401ae775ee3043d1855814cd"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.24.0/tars_0.24.0_darwin_amd64.tar.gz"
      sha256 "1c29f0cd164dfe1e54d05d11d446eaa7f4970add7f1c8602ab7cdfcd232ebca7"
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
