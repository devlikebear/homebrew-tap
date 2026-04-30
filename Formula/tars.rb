class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.61"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.61/tars_0.31.61_darwin_arm64.tar.gz"
      sha256 "68f884de75a148b1c93a7a6c6ff18a2a64b38e2c85fc2bf4c7877238fd1866f9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.61/tars_0.31.61_darwin_amd64.tar.gz"
      sha256 "1861dbddb1ca22abb562378866c019859dbbc341f779af6850a6f9aad92754b1"
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
