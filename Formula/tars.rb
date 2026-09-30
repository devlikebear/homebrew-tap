class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.39.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.39.3/tars_0.39.3_darwin_arm64.tar.gz"
      sha256 "a8c667848c5d86d533eb0748db8f358a10a83fe02d69cc2eb4eb309d05a430f4"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.39.3/tars_0.39.3_darwin_amd64.tar.gz"
      sha256 "d9bfd2592b3fdb2b7902113d5a73a097c5a52c53b02caa881e646a78ec286476"
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
