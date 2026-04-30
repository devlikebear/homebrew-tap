class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.75"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.75/tars_0.31.75_darwin_arm64.tar.gz"
      sha256 "c94dde8e2c9d0ee403a45a5b0a138472730e00498496dca8ab1eecbc9bf79d14"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.75/tars_0.31.75_darwin_amd64.tar.gz"
      sha256 "7277a24c43bdca31b1ba122f3d66b3145d3a05141ba25c5bcda6248ae68ce646"
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
