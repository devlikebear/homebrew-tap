class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.122"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.122/tars_0.31.122_darwin_arm64.tar.gz"
      sha256 "6d758884c657a218cb06be37591b36e3998e830a8cb933d7756099e5580b361c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.122/tars_0.31.122_darwin_amd64.tar.gz"
      sha256 "1b7c168e8f55a36fff07913954655f787c005e7ca497d6f5c152a016ba2a0684"
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
