class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.19.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.19.0/tars_0.19.0_darwin_arm64.tar.gz"
      sha256 "6cbcc4aaa7b3ec7ceb00b5c16637213dc0395f8f1ff4ba85184926737f4a8eed"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.19.0/tars_0.19.0_darwin_amd64.tar.gz"
      sha256 "ef267b399a1de39df342c1cb157fc17be541179b82663ec3ffe1990b7cae672c"
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
