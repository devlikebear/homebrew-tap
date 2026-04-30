class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.71"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.71/tars_0.31.71_darwin_arm64.tar.gz"
      sha256 "c9acf1d4d28d00a09cf5b00ad38b66a1c06887e65f75d4fd56f81fdcd62a320d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.71/tars_0.31.71_darwin_amd64.tar.gz"
      sha256 "0bb3820a109e9c4ada2cf55ba97052b97675659b10d119023fd1fa4a841e3480"
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
