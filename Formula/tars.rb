class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.22.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.22.0/tars_0.22.0_darwin_arm64.tar.gz"
      sha256 "9aa1f7e45575bfe84800a4042cf96144d02ef43866bdfa9d419b3e0e2c316609"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.22.0/tars_0.22.0_darwin_amd64.tar.gz"
      sha256 "964d08c38a3f6701f92ac1d0077bc8fdd6b0b3db282ca52b45093567cb76841f"
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
