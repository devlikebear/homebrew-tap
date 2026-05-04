class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.149"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.149/tars_0.31.149_darwin_arm64.tar.gz"
      sha256 "6f523a66cb6017dd0996dc963f59efdc5cba149cfff196486024eb13baa018f1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.149/tars_0.31.149_darwin_amd64.tar.gz"
      sha256 "0716b3682f27c075c06669525f20462678eb4c40932ab93ede0c81409cbce5e7"
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
