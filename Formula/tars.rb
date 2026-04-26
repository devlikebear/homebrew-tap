class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.9/tars_0.31.9_darwin_arm64.tar.gz"
      sha256 "1ff02ffc0571592b5ba4172f9e1da2c1c9375af28c302e5d94d4dcd4694efbee"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.9/tars_0.31.9_darwin_amd64.tar.gz"
      sha256 "0c3f21b428efa2d6acb7d4603a9ac74c323a7169af41c2c3b71d506d0c7068e8"
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
