class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.166"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.166/tars_0.31.166_darwin_arm64.tar.gz"
      sha256 "a88131ecbda47da423fcee7050b8bc2759af193b92f0345eb0fa49232e95aabe"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.166/tars_0.31.166_darwin_amd64.tar.gz"
      sha256 "b2b02d60e6126ce618efa10e9c1e8f7dfdf14f36cbf0ad9ab6eb2b8791ac1470"
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
