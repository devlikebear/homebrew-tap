class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.101"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.101/tars_0.31.101_darwin_arm64.tar.gz"
      sha256 "8d9cf42952a9c863168729104a4abe9e95d40c38c63c09b968120888f686c2b1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.101/tars_0.31.101_darwin_amd64.tar.gz"
      sha256 "cf9e8bfdf8110a8128e402b21660ee35d0184bf8dec482fb544c19dd3b64dec5"
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
