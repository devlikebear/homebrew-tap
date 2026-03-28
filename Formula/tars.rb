class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.13.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.13.5/tars_0.13.5_darwin_arm64.tar.gz"
      sha256 "817e005fd10daf952407a0b25c2cecddb26fefdf0bb869498acde6aa30768c34"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.13.5/tars_0.13.5_darwin_amd64.tar.gz"
      sha256 "2a079faf1f915b597c6bab4e1b0cfb0d0024b67bb91e08e632ba199f71402ab1"
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
