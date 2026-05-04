class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.148"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.148/tars_0.31.148_darwin_arm64.tar.gz"
      sha256 "876c3c4902edb655fc451c5264dc957cf5fc6bdb5714e109f64e710f2bcfc2cb"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.148/tars_0.31.148_darwin_amd64.tar.gz"
      sha256 "6bf82ad793be0a749632c33708e649ed8c764c361ffa2a507db8fb907701b12f"
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
