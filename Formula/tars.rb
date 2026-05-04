class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.146"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.146/tars_0.31.146_darwin_arm64.tar.gz"
      sha256 "032fb402952941dc0a05a8813238e7ef90b791e76c21c12f5ffb98db372daaff"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.146/tars_0.31.146_darwin_amd64.tar.gz"
      sha256 "873c82f5482a54c42c2f235d57d0473e8a7dd25df644c4e159ebdf1e8bd6a92f"
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
