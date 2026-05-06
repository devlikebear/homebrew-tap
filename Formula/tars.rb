class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.2/tars_0.32.2_darwin_arm64.tar.gz"
      sha256 "007d5b93359a6c1bd34c07f269eadebfc0420c0ec9ab0412e8d1d4b5196e5c08"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.2/tars_0.32.2_darwin_amd64.tar.gz"
      sha256 "ea00f2b51f57f85b12ea89b4740282882ce3ee58c70327f777fa0fccfce5bffb"
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
