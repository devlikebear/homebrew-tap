class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.25.0/tars_0.25.0_darwin_arm64.tar.gz"
      sha256 "2e0f53a6c7c759c21fe28486befcec5a92c5b9ad7729d2a4220c2fd72b2227a5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.25.0/tars_0.25.0_darwin_amd64.tar.gz"
      sha256 "aa352e173e944b86baa8e13e364fc4cc628cc5961da23c6d365314be29d29abb"
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
