class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.178"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.178/tars_0.31.178_darwin_arm64.tar.gz"
      sha256 "58b3fd57bca322c3e2e5460d54cc22eafa317f7b9c18f3e7cd628232ef368c80"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.178/tars_0.31.178_darwin_amd64.tar.gz"
      sha256 "4a6ece7ce50847f397c51dc099c1a2dd7631ad95d96683737ba338275f9f0014"
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
