class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.23/tars_0.32.23_darwin_arm64.tar.gz"
      sha256 "ac332f09d143f89787bcd87fd1bd44713ed2decd9cec3e6737bb64a5dccfbc1b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.23/tars_0.32.23_darwin_amd64.tar.gz"
      sha256 "aa8c63faf71ec093841e4b035cf0a4f2a1ccc64d91cad416eab39a40b4091803"
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
