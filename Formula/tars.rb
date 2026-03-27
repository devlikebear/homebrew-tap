class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.13.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.13.2/tars_0.13.2_darwin_arm64.tar.gz"
      sha256 "0fc8fc5a7e8d6b8a18b3fc6873028ddca11c65214e5e481a3f42ad9f3be99860"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.13.2/tars_0.13.2_darwin_amd64.tar.gz"
      sha256 "4199765e9cf2549029d72687dd0d911422107bc971136e85df42c6170cd43dcb"
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
