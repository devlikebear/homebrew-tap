class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.13.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.13.4/tars_0.13.4_darwin_arm64.tar.gz"
      sha256 "6fd724c362ddd232d9f37239b7e8c452da262edabed363233ca8580966ebfd41"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.13.4/tars_0.13.4_darwin_amd64.tar.gz"
      sha256 "2b02993ad417e2900adc16448c730f65fac1f09305c4d0e0c95ecedbe8cb497c"
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
