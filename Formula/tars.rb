class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.27/tars_0.31.27_darwin_arm64.tar.gz"
      sha256 "1a05594d7f7398739759964f21d579750cb53ec4fa8d9a124660a99d7409ebc8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.27/tars_0.31.27_darwin_amd64.tar.gz"
      sha256 "0feaeae0955d47054b750a7eb889857f5aa2bc02fb82127112528b6aa9d2a010"
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
