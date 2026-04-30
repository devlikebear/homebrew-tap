class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.56"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.56/tars_0.31.56_darwin_arm64.tar.gz"
      sha256 "c0112fd0470451dbe491efcb98cc9fccd4d5bf9a9fc0c8d6737c947333472b8f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.56/tars_0.31.56_darwin_amd64.tar.gz"
      sha256 "80b960b2821169d3cdeb5b8a590716b33181149525ccf87b957a329593b007b5"
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
