class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.13.0/tars_0.13.0_darwin_arm64.tar.gz"
      sha256 "e5ee38321b752e8c65d4850fd058b89f23aef8ce3cf1b110e7d70a411fb53cbc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.13.0/tars_0.13.0_darwin_amd64.tar.gz"
      sha256 "7316bb7f666f7cfd73694d6d24feae49e55550ba88cdded59cfb4f11b529dc14"
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
