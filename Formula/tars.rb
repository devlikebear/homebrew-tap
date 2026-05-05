class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.167"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.167/tars_0.31.167_darwin_arm64.tar.gz"
      sha256 "1b886cef9e3f617877b04a10f5c791f974965b9cd193100695bdd0086988e626"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.167/tars_0.31.167_darwin_amd64.tar.gz"
      sha256 "60b08c74295854359fe3f6e7638fda388bca7c8b9bf52dd21b7a2f2a47546e6e"
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
