class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.126"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.126/tars_0.31.126_darwin_arm64.tar.gz"
      sha256 "1e77002bc9b6331a249ec5f86fc31118af6016b791200c7529a56bca8b35039d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.126/tars_0.31.126_darwin_amd64.tar.gz"
      sha256 "27338ec63cace9c888a2a2e0a0b3b04e1edcb030322ec286b6df4ef46c52f782"
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
