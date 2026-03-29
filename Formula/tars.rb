class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.14.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.14.3/tars_0.14.3_darwin_arm64.tar.gz"
      sha256 "6e115648127f8758df5b8714ca0625784cb1988d6503b450699ae9da0f526cfd"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.14.3/tars_0.14.3_darwin_amd64.tar.gz"
      sha256 "2228b174e03e149394f3c180202e4cdaa5f833d9fe545ffb3bd558f2db577693"
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
