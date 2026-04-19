class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.28.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.28.0/tars_0.28.0_darwin_arm64.tar.gz"
      sha256 "e9956c278abc8fe31579d9ffc16bcb6817f9a0bda29ebff707cafcf9c5886d38"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.28.0/tars_0.28.0_darwin_amd64.tar.gz"
      sha256 "f77939dcc749056c7499361e6caceae8eb6a8e2e37499699f8a8047dd78bc647"
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
