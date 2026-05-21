class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.72"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.72/tars_0.32.72_darwin_arm64.tar.gz"
      sha256 "a90ff07ab740ca3e3ba2c8da285b12ac851775cf6ef6ad4f53ac6b6a1c17e0d5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.72/tars_0.32.72_darwin_amd64.tar.gz"
      sha256 "f93d24196b7dbe0e6e7e4db8d8baf4757dcc13a22528f046d787ba0a71ff99cc"
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
