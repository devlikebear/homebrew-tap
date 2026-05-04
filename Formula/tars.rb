class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.150"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.150/tars_0.31.150_darwin_arm64.tar.gz"
      sha256 "8860f07141e76640e2292bd8305d53d26987501197375fe3908a816c5bb9ede8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.150/tars_0.31.150_darwin_amd64.tar.gz"
      sha256 "13635da45cabbb45ba92f63d09943b5eba19ec19cac9f88981496daa600697b9"
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
