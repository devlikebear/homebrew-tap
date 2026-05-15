class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.67"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.67/tars_0.32.67_darwin_arm64.tar.gz"
      sha256 "e420296fb57a8445aa9e7e37d99bf370b467490a43cf6eb2da4cd9843b08defc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.67/tars_0.32.67_darwin_amd64.tar.gz"
      sha256 "f09ceb610a254b0d7fb8f539a28b588054c635169c826e73766baa3112091d42"
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
