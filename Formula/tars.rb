class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.179"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.179/tars_0.31.179_darwin_arm64.tar.gz"
      sha256 "f78682fdad95091c21ee229dce56e749c8e99687cc976a10df4b95f2cea926d0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.179/tars_0.31.179_darwin_amd64.tar.gz"
      sha256 "926233be3de4b7b966533f891558783e36b1935b8dcab48a248e9a24263e3290"
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
