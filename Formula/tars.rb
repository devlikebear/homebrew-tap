class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.162"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.162/tars_0.31.162_darwin_arm64.tar.gz"
      sha256 "2558fc3ca14a00d599ebf2b76256177bdf3e2baa2eb6ba141f49f764e7f142be"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.162/tars_0.31.162_darwin_amd64.tar.gz"
      sha256 "8ff3935960fffcbf067305b6c1a20660d83cc3e2fdfc7853b8cf573be0dcbb49"
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
