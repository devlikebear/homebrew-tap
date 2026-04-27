class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.13/tars_0.31.13_darwin_arm64.tar.gz"
      sha256 "255fe86109f9c3a78cabb16beb381422074eb5a93410ca4c4b8a6f735107f558"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.13/tars_0.31.13_darwin_amd64.tar.gz"
      sha256 "03a6e50f6532068503b848a91b989b4737b36f75734c9d3c0c1f9a7472aa14a0"
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
