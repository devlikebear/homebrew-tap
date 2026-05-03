class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.133"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.133/tars_0.31.133_darwin_arm64.tar.gz"
      sha256 "8945ef690280b02a99fa9ce5eaedd7d5d29d7f26021b1408eecb089385b81027"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.133/tars_0.31.133_darwin_amd64.tar.gz"
      sha256 "49dde7a27491ea6347d09158afd5842bc231a70dd5a99b19394b3ecb6d924c08"
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
