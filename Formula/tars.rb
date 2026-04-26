class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.29.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.29.0/tars_0.29.0_darwin_arm64.tar.gz"
      sha256 "9a43c8f516790fc1c8e1815d2a080ebd0d9828d104dcd70ab53b1a97908b8a7b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.29.0/tars_0.29.0_darwin_amd64.tar.gz"
      sha256 "672678415326ae0d23ea6ffecd37184d370999c9e464bd3e4a9a13cfb3ac060d"
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
