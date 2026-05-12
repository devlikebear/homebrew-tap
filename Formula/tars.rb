class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.39/tars_0.32.39_darwin_arm64.tar.gz"
      sha256 "1c24697be115892843295f06bd7354bfdc35987111d08041c9d36c030f3093b9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.39/tars_0.32.39_darwin_amd64.tar.gz"
      sha256 "51d7b1413eeb66bbdd470b14a95c651f3f5fc8fee2124aec30feefaaf8c4a612"
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
