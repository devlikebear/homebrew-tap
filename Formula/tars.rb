class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.55"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.55/tars_0.32.55_darwin_arm64.tar.gz"
      sha256 "7645c9e5d687730f868bb42ea8323b301d5730c1e8c2edd657ef8d33d23dd2cc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.55/tars_0.32.55_darwin_amd64.tar.gz"
      sha256 "657f5f79eaf9fade726d6ab688134b876dd1fb30cfa5f332523718250f801547"
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
