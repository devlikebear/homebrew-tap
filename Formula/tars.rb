class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.60"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.60/tars_0.31.60_darwin_arm64.tar.gz"
      sha256 "50ab40c871a2ef9b92f0224118103ca93dd706028af629b88ebf493a823afe83"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.60/tars_0.31.60_darwin_amd64.tar.gz"
      sha256 "dee2f4a87cacfb9a037cb436c1092c89975397ed83944bac5af86aaac9e5dc18"
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
