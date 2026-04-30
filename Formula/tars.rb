class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.70"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.70/tars_0.31.70_darwin_arm64.tar.gz"
      sha256 "1f0326b89d3cf8f66560bcbf4d2f860fab13babd893cdfbe6ace37b4136fb19d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.70/tars_0.31.70_darwin_amd64.tar.gz"
      sha256 "0ff1b744054e286a6ec8381b8a001a63f74e4c65a9d898ead1bfd4c15a2f40d8"
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
