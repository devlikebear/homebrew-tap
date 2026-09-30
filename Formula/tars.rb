class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.3/tars_0.40.3_darwin_arm64.tar.gz"
      sha256 "e472de0cf14bb6ee9a6757dc91b822af69227be9714a259e26a2fba1611cd6f0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.3/tars_0.40.3_darwin_amd64.tar.gz"
      sha256 "f239d17305c9ac1b088648550873b90e635bbcde5118ff5f4d86d6f507821082"
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
