class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.14.1/tars_0.14.1_darwin_arm64.tar.gz"
      sha256 "d3440698e454da72a5eebd00ae88ce9daf1fcf5d91a51a0482753f386f559b9c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.14.1/tars_0.14.1_darwin_amd64.tar.gz"
      sha256 "3af34ce13423292ce099c800c26fc5e8b4cfd2d77ff5b5603eef8fe0888708de"
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
