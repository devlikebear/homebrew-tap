class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.156"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.156/tars_0.31.156_darwin_arm64.tar.gz"
      sha256 "170739d287ca999ca327108225d2f649fa537792613aa6b583a72d4b56589895"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.156/tars_0.31.156_darwin_amd64.tar.gz"
      sha256 "839a273333e6902a5dc100dc36dedb936c7141f34ba127660b6cc9728d7c1d16"
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
