class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.37.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.37.1/tars_0.37.1_darwin_arm64.tar.gz"
      sha256 "954fa761bf44b386663f6449427a22948b87d1d1d9c68b497839881378eb875c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.37.1/tars_0.37.1_darwin_amd64.tar.gz"
      sha256 "148397a6436232d4d7811fb6ec49a9fc1088770081a772d8c25bf6cd3c40783e"
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
