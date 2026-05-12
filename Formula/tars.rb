class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.41"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.41/tars_0.32.41_darwin_arm64.tar.gz"
      sha256 "8bee726a61cfd2de87c034187eab5627fd966076af23e50660df291f1af6f15f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.41/tars_0.32.41_darwin_amd64.tar.gz"
      sha256 "2c6011e20e9405d95da2e1da4b82ba6555f3e01bc246e3f3063fa117623c9fc1"
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
