class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.95"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.95/tars_0.31.95_darwin_arm64.tar.gz"
      sha256 "2b7761bc2205647ed5a1f31492ad9f07c5d626049a791c2d18efb212bb72cb15"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.95/tars_0.31.95_darwin_amd64.tar.gz"
      sha256 "1cc8a783e0c038e60ffdd0110c414ca6348df01990fb764a24f47e076a9be9eb"
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
