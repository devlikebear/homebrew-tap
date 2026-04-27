class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.16/tars_0.31.16_darwin_arm64.tar.gz"
      sha256 "c310770d9753a3efd8ae5fb2c21ee71e80e17d28595bfe1a74b7feb491f9b2d6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.16/tars_0.31.16_darwin_amd64.tar.gz"
      sha256 "b0485131c0b8aaab86d8beef3c8e880fcee8e43555cdfef80fb64e7e4ff6ba24"
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
