class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.69"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.69/tars_0.32.69_darwin_arm64.tar.gz"
      sha256 "dc60efdcc0844865726033ade7d0cd952edf200fb296c2d89e41e1c4327fc9c1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.69/tars_0.32.69_darwin_amd64.tar.gz"
      sha256 "0d34b1b633e6692e2953454536848b8ad2e1669f7ebf133c603ddff699fb9cb2"
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
