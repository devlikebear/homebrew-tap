class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.161"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.161/tars_0.31.161_darwin_arm64.tar.gz"
      sha256 "8da9ba8b3a7d970b22ec447eb3524ac4b40147f706cc39ab52389361ede5f60d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.161/tars_0.31.161_darwin_amd64.tar.gz"
      sha256 "e336bfffe7436b187c9a7bb5304aeaf6d9fe5f511fcd5cf1cb4ec00b21bf2095"
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
