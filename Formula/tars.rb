class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.163"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.163/tars_0.31.163_darwin_arm64.tar.gz"
      sha256 "f2c1b96ba1e95d44c73e1f3bd80ebdb11492763e2e5834360a86fc1c954247d7"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.163/tars_0.31.163_darwin_amd64.tar.gz"
      sha256 "ceb185389e609dea862f85a7873c752e35ff053c130f39a9ce773f4de8c006f7"
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
