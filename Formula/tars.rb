class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.158"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.158/tars_0.31.158_darwin_arm64.tar.gz"
      sha256 "06f6289948c970dc3a8c6c5263882926d0af429c656e0868aefe30daac4b269d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.158/tars_0.31.158_darwin_amd64.tar.gz"
      sha256 "cf3abeda2261f0ca59333c23d97cd48d9f2ecef4894bf103b7491cd731ccfa11"
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
