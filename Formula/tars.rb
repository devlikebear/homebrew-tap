class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.3/tars_0.31.3_darwin_arm64.tar.gz"
      sha256 "bca5ec1aeb06b8d883056e5232f0266a7bdcdd8ad5659104462a9b2ffc02e5f3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.3/tars_0.31.3_darwin_amd64.tar.gz"
      sha256 "24a640270c6ba42b3b7741088589712d8a8a4cbedd5bce62d97baea57b9f1465"
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
