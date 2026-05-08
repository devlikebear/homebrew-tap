class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.4/tars_0.32.4_darwin_arm64.tar.gz"
      sha256 "677ec9b07152042be355e1248bbbc8981f99a7e385b19548ffb79db2885f4229"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.4/tars_0.32.4_darwin_amd64.tar.gz"
      sha256 "efc46af4dc5d73c364b65f62a8a61bef51fc81c620b1df68e3529e6ae5db74e3"
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
