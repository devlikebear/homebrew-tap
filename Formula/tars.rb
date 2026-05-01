class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.96"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.96/tars_0.31.96_darwin_arm64.tar.gz"
      sha256 "475e81e9c1494555aa24cd4937a2ad9b6f1be984cbafe2f20154246eaeef7f15"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.96/tars_0.31.96_darwin_amd64.tar.gz"
      sha256 "cef1c768a4eba5afc770507d8508906203326139d754715d264fda321880f3b3"
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
