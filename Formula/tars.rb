class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.89"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.89/tars_0.31.89_darwin_arm64.tar.gz"
      sha256 "0fd54012ae45036ef25fa71d4988c92a75770f5bf473378d5bcac79157f802f6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.89/tars_0.31.89_darwin_amd64.tar.gz"
      sha256 "61ad5e27afe49341f5e85f6be30caa7ee863f8e94205ca0132ef8338d9c09565"
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
