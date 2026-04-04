class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.17.0/tars_0.17.0_darwin_arm64.tar.gz"
      sha256 "d5b2d840bf4fc88e84d3e4d35ed3701d47ea706633b426dd00759a3ce5ca6a53"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.17.0/tars_0.17.0_darwin_amd64.tar.gz"
      sha256 "c6db5e87ecaf4dffdab62c7cee31a5823dc72b654bf006b41fa74da2d35c1315"
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
