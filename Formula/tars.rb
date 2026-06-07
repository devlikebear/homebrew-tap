class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.34.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.34.1/tars_0.34.1_darwin_arm64.tar.gz"
      sha256 "52a49f38ee1f8287f496127618d281081c8e7cc711818597f346a7b07d1efaa0"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.34.1/tars_0.34.1_darwin_amd64.tar.gz"
      sha256 "9c3dd9c65210b48760689a6127ddb23c0d325d6cf43869040a82dddaf6ddacf5"
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
