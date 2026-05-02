class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.127"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.127/tars_0.31.127_darwin_arm64.tar.gz"
      sha256 "9d619c863e21d59d62b76b269f52c70649e92b36a6d63c95ed977a9d1aaab04f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.127/tars_0.31.127_darwin_amd64.tar.gz"
      sha256 "cc9967e5afb4e68e1e3c1b4ee4e821c44d2677e83083993901298b5e52e4fd40"
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
