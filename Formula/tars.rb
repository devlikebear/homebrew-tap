class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.12/tars_0.32.12_darwin_arm64.tar.gz"
      sha256 "539bf7a554b767b2d897bb8a30699d5ccc5e214f1efff1e38a3f9ee6eebfaf6e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.12/tars_0.32.12_darwin_amd64.tar.gz"
      sha256 "a15d78e14cacf5a64ae56f7e503ac6109acb5f80b1fa41c4d172663ad4e78695"
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
