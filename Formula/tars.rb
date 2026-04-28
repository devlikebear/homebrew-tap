class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.20/tars_0.31.20_darwin_arm64.tar.gz"
      sha256 "3b9776c6d4e57eb08b1c61f0990aceba332da6738dc15797ff768103c314a44e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.20/tars_0.31.20_darwin_amd64.tar.gz"
      sha256 "b7642661ea9a3f5e96d193955c59b769bdb9f1f03b6dfbc64eb565b330779922"
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
