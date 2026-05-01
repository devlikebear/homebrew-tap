class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.97"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.97/tars_0.31.97_darwin_arm64.tar.gz"
      sha256 "3b3170f668a346daa69039a4680cf9defef768d9f054ac7399dfc75d5c2299bc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.97/tars_0.31.97_darwin_amd64.tar.gz"
      sha256 "109578ebfa209f5f7f0584840c6c0add582a39803be34bcd85bc981bb6d56bdd"
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
