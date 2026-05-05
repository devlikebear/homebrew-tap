class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.164"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.164/tars_0.31.164_darwin_arm64.tar.gz"
      sha256 "b49290318352edec5d3bbf902343d2cfd6004dc173f78b68890bea7f63e5d761"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.164/tars_0.31.164_darwin_amd64.tar.gz"
      sha256 "19e4ae66a1c09c187c57a3dc816f2a0b30df409249b94b09acbdb714c873184d"
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
