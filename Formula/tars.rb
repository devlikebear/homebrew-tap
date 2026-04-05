class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.23.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.23.0/tars_0.23.0_darwin_arm64.tar.gz"
      sha256 "09984c72a133ccb1e6e18121a7f4d8dfb26cd5a3810db686775564a89f7ff044"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.23.0/tars_0.23.0_darwin_amd64.tar.gz"
      sha256 "694a57c6b607b24bdefb13c50485be6d97d21d72461675871ee78cb4edf2dc3a"
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
