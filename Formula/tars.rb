class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.34/tars_0.31.34_darwin_arm64.tar.gz"
      sha256 "6939a73748bc4b90056dac9556c7d24f4774bbf82f777b0ff95359bdb37cd146"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.34/tars_0.31.34_darwin_amd64.tar.gz"
      sha256 "4ab1f9daee89d501c624f72a3887c7047646f23655a35db55f0cac1db329468d"
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
