class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.120"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.120/tars_0.31.120_darwin_arm64.tar.gz"
      sha256 "0a41190a3d3c7fbc2a30d05c44fad0987b80b1c6cbde5f4c29ed8021247a2f2e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.120/tars_0.31.120_darwin_amd64.tar.gz"
      sha256 "5b301baa89ee2934e1e8de4a5e36a5350fc72cd29b0df57464adcafa3c5c4787"
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
