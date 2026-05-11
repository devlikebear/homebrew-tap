class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.31/tars_0.32.31_darwin_arm64.tar.gz"
      sha256 "3ba6e63007af279ff721b872801f3a22b4f1a66adfbafba7a082353a957efa6e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.31/tars_0.32.31_darwin_amd64.tar.gz"
      sha256 "58d98da2a572981c0bae83b58ce1d523b1ad17e21c792eda7e3dc2997387a1d3"
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
