class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.61"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.61/tars_0.32.61_darwin_arm64.tar.gz"
      sha256 "283ce5a82d8c96b5326a02cee9537d600d841e236cdf75eb88208ee457418db1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.61/tars_0.32.61_darwin_amd64.tar.gz"
      sha256 "cde0c34de5eee9cdf923fb8e781ae577950fd22dd05c0effc0f2d5712d9b7289"
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
