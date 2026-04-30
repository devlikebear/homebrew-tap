class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.63"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.63/tars_0.31.63_darwin_arm64.tar.gz"
      sha256 "543e37d938ab73f5d23ad6bda6c4706283d151260b26600893f533b234c1c251"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.63/tars_0.31.63_darwin_amd64.tar.gz"
      sha256 "0a81adbefe94953eb3ae9334c1312f9be6e5b68c5b39f3ed553580ed92f3789d"
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
