class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.13/tars_0.32.13_darwin_arm64.tar.gz"
      sha256 "4fc9fb5412402703d8a8770fe677cb54b93729fd2da76ffdf119a2ea2d80329a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.13/tars_0.32.13_darwin_amd64.tar.gz"
      sha256 "e97bfeb3a45c691cd40e6d9746af03a1ee01d1246d5e9339b7da76b1213c8ac1"
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
