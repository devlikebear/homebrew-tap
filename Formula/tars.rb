class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.16/tars_0.32.16_darwin_arm64.tar.gz"
      sha256 "5d0f63b8108c7462be5b1d6dce383cc65981e43af0c3bd290b39f36aed1347b4"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.16/tars_0.32.16_darwin_amd64.tar.gz"
      sha256 "10ecf839c10ed342f122de5860a8e72a989164455982edf4446c8c1912c2973f"
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
