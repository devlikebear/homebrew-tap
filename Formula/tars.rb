class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.49"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.49/tars_0.32.49_darwin_arm64.tar.gz"
      sha256 "2c197c7973936282d8db708718708bb6233bf9380003ec7388fb7192feda936e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.49/tars_0.32.49_darwin_amd64.tar.gz"
      sha256 "bb4bc8a55dbefd962abd93374d46ccf5f06798ff3e34c6be8ae95c5e61a4a315"
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
