class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.34.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.34.3/tars_0.34.3_darwin_arm64.tar.gz"
      sha256 "c022c30a2bc32eac7c1aae5a67a1f0baeaf1edceb7b9d6bc3632662232598d8e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.34.3/tars_0.34.3_darwin_amd64.tar.gz"
      sha256 "7aa2d10cc20cd63ddef3648384e2f12f98686c66c4e2652e141a44fcb20d4512"
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
