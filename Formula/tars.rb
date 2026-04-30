class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.30/tars_0.31.30_darwin_arm64.tar.gz"
      sha256 "3f86ff10ddb037b468fcd1759b0ddd4bdd5fb27455713734642b9f4445a84f51"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.30/tars_0.31.30_darwin_amd64.tar.gz"
      sha256 "68e9ece15c04ca132dc66a6d3e1a8f39e5d61651793c904c1d9e2493e27722de"
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
