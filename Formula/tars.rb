class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.26/tars_0.32.26_darwin_arm64.tar.gz"
      sha256 "72660506f044baec35fd9f78de7af0b6898a59156511b1f53b66695da2b475cc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.26/tars_0.32.26_darwin_amd64.tar.gz"
      sha256 "68cb7258a4c981b98446f65cd8d6dc491fe330a67b0a5dd002b88f3323426ad6"
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
