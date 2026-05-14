class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.64"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.64/tars_0.32.64_darwin_arm64.tar.gz"
      sha256 "add1ee0ccae0b23dd976bf4b96f40eee21abbc1d2fe3bb55919d02b022edf59f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.64/tars_0.32.64_darwin_amd64.tar.gz"
      sha256 "cecd55db84e7265ee306efeeef6c781613ad6ed14e99bda811a6ae805800c3e6"
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
