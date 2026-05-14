class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.52"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.52/tars_0.32.52_darwin_arm64.tar.gz"
      sha256 "7b3315adaf3dd4b93e9bbc2f216428942c9a0400a04ca75c5a9074f6a535ebed"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.52/tars_0.32.52_darwin_amd64.tar.gz"
      sha256 "999f287a0ce70e173e1da8103430bceaf5c293f1e991a1159c3c2246bc3f2d38"
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
