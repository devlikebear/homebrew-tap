class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.132"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.132/tars_0.31.132_darwin_arm64.tar.gz"
      sha256 "0deacfc00a30d3f90b47b3f2a6692000d4792288e05aa660bf70208cff558557"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.132/tars_0.31.132_darwin_amd64.tar.gz"
      sha256 "b4ecf168181b34ddd3db903c4c0ceb0984763d8f00d7a7b5a888532628b03dfb"
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
