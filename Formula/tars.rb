class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.107"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.107/tars_0.31.107_darwin_arm64.tar.gz"
      sha256 "1d836fa0bc4e97ad50730522e8065eba86b0a393f7ea640309d60f9c405423f2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.107/tars_0.31.107_darwin_amd64.tar.gz"
      sha256 "d868ca25f54d976ccb75ebd6275bfc0979990bbcab1f8508c896200a26593b90"
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
