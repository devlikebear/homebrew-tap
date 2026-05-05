class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.174"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.174/tars_0.31.174_darwin_arm64.tar.gz"
      sha256 "97c724d011a923ac1df6c065153fa304906afe70d6ff8b56207fea77bad7006d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.174/tars_0.31.174_darwin_amd64.tar.gz"
      sha256 "09c08be8472bdd74fad9b440366f43eb374597d592209a5332f697bc02b4f206"
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
