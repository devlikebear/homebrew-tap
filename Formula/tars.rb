class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.47/tars_0.31.47_darwin_arm64.tar.gz"
      sha256 "67340cc633a2b8494fdc4663e7960bcab1b1711abe1ee0b7f851eb051bf70866"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.47/tars_0.31.47_darwin_amd64.tar.gz"
      sha256 "a7199fd4352aeace336c4c19f3928392f0a6ddbfe9687c2e5d5e352950365810"
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
