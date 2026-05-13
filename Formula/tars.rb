class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.47/tars_0.32.47_darwin_arm64.tar.gz"
      sha256 "9b5bb6e33b45a30c0d780e79c5571ff4f62f9adf881dc86242da411ca78f77ff"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.47/tars_0.32.47_darwin_amd64.tar.gz"
      sha256 "d888895a22580c654488cb371387663c8dbbfab39b74922b6545357e8ebf2c25"
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
