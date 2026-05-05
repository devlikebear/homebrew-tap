class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.172"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.172/tars_0.31.172_darwin_arm64.tar.gz"
      sha256 "98cf812b58ef31086ffdeb46ebb8f4954d8cb520f6b7aafe79d0986ade8edb93"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.172/tars_0.31.172_darwin_amd64.tar.gz"
      sha256 "7dc6dbd9e34f7c067c0699c754c5203156deb86091dd96c3b4fc8d9ba8412e95"
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
