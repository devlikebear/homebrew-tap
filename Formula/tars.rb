class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.39.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.39.1/tars_0.39.1_darwin_arm64.tar.gz"
      sha256 "aed5827fe8de5f8c6e14cb217133e8ef949ddf26fb6409afc9e60af5598a6e5d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.39.1/tars_0.39.1_darwin_amd64.tar.gz"
      sha256 "28251b5a11737987bb2df73dbd13f2f38fb179af658bc710302731a857834cc2"
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
