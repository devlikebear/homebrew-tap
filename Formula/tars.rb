class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.23/tars_0.31.23_darwin_arm64.tar.gz"
      sha256 "16cd40444a8a2e0541d878cad9878e4499e343ec98d767a992027902c880c05d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.23/tars_0.31.23_darwin_amd64.tar.gz"
      sha256 "cab476b33d43bca0a56ce4f5120cf493749d8d03f7cfcbe9d3d2f92438cc6b86"
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
