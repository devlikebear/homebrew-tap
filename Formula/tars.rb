class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.33.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.33.2/tars_0.33.2_darwin_arm64.tar.gz"
      sha256 "0e40440cb77148b1312fa6917581e9c08a19f9640781fe86878b97eb91454b76"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.33.2/tars_0.33.2_darwin_amd64.tar.gz"
      sha256 "1319a2a6bfa8ce417836f563541d7a7b8d5d573c392c3321881351d38833bba4"
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
