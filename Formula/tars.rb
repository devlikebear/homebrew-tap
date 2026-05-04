class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.153"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.153/tars_0.31.153_darwin_arm64.tar.gz"
      sha256 "82799f430db63d00ffa89ad09a7c3cfda65480a9ecc77e30dd3c354128668edf"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.153/tars_0.31.153_darwin_amd64.tar.gz"
      sha256 "c6b2d67554d7d92c9cc09374c34f81e1cada903866a38a11613507fedad416fe"
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
