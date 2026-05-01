class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.92"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.92/tars_0.31.92_darwin_arm64.tar.gz"
      sha256 "93614957da67d7e811e301c97314173ba96a8b450ca591eee4dce8914ec3f1e3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.92/tars_0.31.92_darwin_amd64.tar.gz"
      sha256 "76343eb24f902dfa506a9884712c4e4d65626bb26b8c2a1063f3bdfd90bc1e88"
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
