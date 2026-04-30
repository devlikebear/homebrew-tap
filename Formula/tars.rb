class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.74"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.74/tars_0.31.74_darwin_arm64.tar.gz"
      sha256 "efc386d1ac05909022a7d8f53861ef42aa53529162997bd2665b87bbd3d18bd2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.74/tars_0.31.74_darwin_amd64.tar.gz"
      sha256 "589125cda07af84792968a1fefecbac7014fbd8ac96447f02910c360b0a4bdce"
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
