class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.44"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.44/tars_0.32.44_darwin_arm64.tar.gz"
      sha256 "bc8f03f59e7224212c8f8c684200d9753a044abe2ac07b1ed859237526d64bcc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.44/tars_0.32.44_darwin_amd64.tar.gz"
      sha256 "d4ac0e08b73f118be92ba13db7ac238ab0adbecc87cba1e6d9b66a6cc5e9eeaa"
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
