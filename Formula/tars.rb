class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.33/tars_0.31.33_darwin_arm64.tar.gz"
      sha256 "f59491592e0719900e1b3b0bd08215f7ebe890e62422dd425a8d09f94d702ab1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.33/tars_0.31.33_darwin_amd64.tar.gz"
      sha256 "8001ddebeeaefbbc851fe61675d13f90fc82a3bce0ac778e55c5d5451c5322a9"
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
