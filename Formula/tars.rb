class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.86"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.86/tars_0.31.86_darwin_arm64.tar.gz"
      sha256 "1fcf0b9d0e102891a4ea114657b4bcc4a60f815c05221541a621c1263befdcd7"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.86/tars_0.31.86_darwin_amd64.tar.gz"
      sha256 "904b2201c7bbabcf241edf8c784bb052ce8b1ef9b21097bd30b40615a92783e4"
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
