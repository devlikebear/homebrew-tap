class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.88"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.88/tars_0.31.88_darwin_arm64.tar.gz"
      sha256 "9b6ac68eeb7419e50fce32d2eca903cf43223136af95befbe8eebc020616c0a9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.88/tars_0.31.88_darwin_amd64.tar.gz"
      sha256 "b9bfceb45e52db60b3fd74fa3676bcabdef71ea1df1921beea498a6a66319540"
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
