class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.45"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.45/tars_0.31.45_darwin_arm64.tar.gz"
      sha256 "24e97fcc67323be333fc0125b1a70aeb2bbc7a011729082f9ada3dabb5152258"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.45/tars_0.31.45_darwin_amd64.tar.gz"
      sha256 "ef02938c547457f14b45dd52032f7b299bd8ab1b1f207ed01cdc10f890c54e0b"
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
