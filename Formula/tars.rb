class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.16.0/tars_0.16.0_darwin_arm64.tar.gz"
      sha256 "25d819dc7f2917e0fc38665954c092cb1d18345a1b8473886b2665d68b3bc3d5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.16.0/tars_0.16.0_darwin_amd64.tar.gz"
      sha256 "cd01d7d3882beaa1a67191571fb9c8fffc5316d5ab62d9c980866e294302dd97"
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
