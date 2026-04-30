class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.76"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.76/tars_0.31.76_darwin_arm64.tar.gz"
      sha256 "8fca5850f6fbdc0c258b884cde3aa3cb93948d92adca2934c5a83cfadf4f3b6a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.76/tars_0.31.76_darwin_amd64.tar.gz"
      sha256 "bf213ee2560312db36b9559b675fa0e3cf69563ca811334887c85045da6ad72d"
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
