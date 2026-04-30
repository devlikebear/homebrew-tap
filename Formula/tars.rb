class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.50"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.50/tars_0.31.50_darwin_arm64.tar.gz"
      sha256 "317701873c9c935da26cb67f3ee6c0454826280f08077a27410049d013dc7d12"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.50/tars_0.31.50_darwin_amd64.tar.gz"
      sha256 "28f64b7bab67d7bf33e1841ddf4a92e9b8fe8911c9224c9f9e9f37cc88b56922"
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
