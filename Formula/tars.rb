class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.6/tars_0.32.6_darwin_arm64.tar.gz"
      sha256 "149fde8f632c4932155930c7409d69ae2fabc8698255d3a0a451f5ae5bbb688a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.6/tars_0.32.6_darwin_amd64.tar.gz"
      sha256 "c4d83d14697fbb832c7f9538538fcd4bbbff67391108bbc21fe819aa094a9570"
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
