class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.50"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.50/tars_0.32.50_darwin_arm64.tar.gz"
      sha256 "67e10ad6e85eeae5cf0ad69153f0b1b8054946206ba5737c6d674c185a2c7c42"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.50/tars_0.32.50_darwin_amd64.tar.gz"
      sha256 "6b1767203db29eaa50bff02f8d0d1f164efe07a3d996563bd27121a6d1e710ab"
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
