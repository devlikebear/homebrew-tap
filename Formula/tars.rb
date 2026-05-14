class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.53"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.53/tars_0.32.53_darwin_arm64.tar.gz"
      sha256 "cd37a179cbd06eae2e85dbc8c233b859bcb3f4310f6be9fd9dbf3a3c02d41561"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.53/tars_0.32.53_darwin_amd64.tar.gz"
      sha256 "f813bdbe5e294e9229ea7b57bb011ba84d93b373ef565ce501b7a7bd36d392fa"
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
