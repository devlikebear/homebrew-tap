class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.73"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.73/tars_0.31.73_darwin_arm64.tar.gz"
      sha256 "422895cbf176f779216a92c34f5f1e4ae26aa5724833044738ed0c28623eb378"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.73/tars_0.31.73_darwin_amd64.tar.gz"
      sha256 "50a510c0aeb43d6cad10a56d1032434e0ad679bbf826ada2f181bfca172040e2"
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
