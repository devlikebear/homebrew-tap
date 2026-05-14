class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.62"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.62/tars_0.32.62_darwin_arm64.tar.gz"
      sha256 "519a6fbe19aa8d93a679642d649dec0a70ac1d265252cb5146cecaa664d3c923"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.62/tars_0.32.62_darwin_amd64.tar.gz"
      sha256 "f2c25d9807777694ff9801bcff1e25a24b6d687868a36adbb711b60ccb69d18e"
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
