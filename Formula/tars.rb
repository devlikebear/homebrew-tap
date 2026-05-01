class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.121"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.121/tars_0.31.121_darwin_arm64.tar.gz"
      sha256 "4420b65670572a7aa87e69b6de3e93875b286d7f811548b4b61b663cfcac37b6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.121/tars_0.31.121_darwin_amd64.tar.gz"
      sha256 "4345bea54d75159c63f34a83f17a24325bd9183dfab18534326453831deccef1"
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
