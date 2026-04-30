class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.39/tars_0.31.39_darwin_arm64.tar.gz"
      sha256 "012c71c60758ac31490e874b14809625a674fe319bb0475f4eef8c0b04b21217"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.39/tars_0.31.39_darwin_amd64.tar.gz"
      sha256 "d209afc704ab5f818cb0fbb66e5b7b0d0ffdfce9859c5742c29498d1b53232b4"
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
