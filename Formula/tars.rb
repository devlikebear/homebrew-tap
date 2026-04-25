class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.28.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.28.4/tars_0.28.4_darwin_arm64.tar.gz"
      sha256 "4d5c2354b5c30545eb2dd956f42cb357a39bd9b6cc8482ec5a08a8334c6458c8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.28.4/tars_0.28.4_darwin_amd64.tar.gz"
      sha256 "4b7e975261f6af638bb0a6b0a9f46a16f0c48bd09f9e4612dc61147341f72eb2"
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
