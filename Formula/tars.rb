class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.58"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.58/tars_0.32.58_darwin_arm64.tar.gz"
      sha256 "c1524ab5bf4bc03a6f6954bb5660dc23badbbef2e749d504614d765d98d14efd"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.58/tars_0.32.58_darwin_amd64.tar.gz"
      sha256 "04a2d7827cdf60a95482ad6b5870cc5d419cac54014e47440ac21db9ba329cd7"
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
