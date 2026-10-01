class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.41.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.41.0/tars_0.41.0_darwin_arm64.tar.gz"
      sha256 "7e4bc843140047c020aed49fe67f9ec82bdecd105352aa4c3fb7f7472ff3b51d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.41.0/tars_0.41.0_darwin_amd64.tar.gz"
      sha256 "85580168f4137f61987b6274caf03fea407f690dcca9536dcf2f7926904b4ec0"
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
