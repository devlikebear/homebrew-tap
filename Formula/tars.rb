class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.108"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.108/tars_0.31.108_darwin_arm64.tar.gz"
      sha256 "08a0cba83a915eb9d0a6b67457274c48ad6fdd81492110d19990089f7ce4a651"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.108/tars_0.31.108_darwin_amd64.tar.gz"
      sha256 "1735dd39ec9204034ff9ff1e1f4b13440973c2f27d1e1634cb480a4d05da6bd5"
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
