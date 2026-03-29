class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.14.0/tars_0.14.0_darwin_arm64.tar.gz"
      sha256 "d4f702932bdb30e2875c900697cb03ddc1c590022704a5cb8c3afe4f462a4cbd"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.14.0/tars_0.14.0_darwin_amd64.tar.gz"
      sha256 "26340fe447586d8a3ff847fd538263cb0f5adc05846d4dd0eb50b88e116a4ad3"
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
