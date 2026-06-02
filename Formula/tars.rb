class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.33.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.33.3/tars_0.33.3_darwin_arm64.tar.gz"
      sha256 "b22edaeeadae7ca333d7fa968e57260a6265c1990b9acb403cb92371468747b0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.33.3/tars_0.33.3_darwin_amd64.tar.gz"
      sha256 "2abf1318243f2be4c7cc9439eda0e5105e190064d5911bdd0d566796a8e74da7"
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
