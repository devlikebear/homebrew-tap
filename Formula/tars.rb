class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.173"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.173/tars_0.31.173_darwin_arm64.tar.gz"
      sha256 "003a943b6977f5c4cedb4120ebb0d9ae4eea597752d87b8b2e5ba0a91ea26b99"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.173/tars_0.31.173_darwin_amd64.tar.gz"
      sha256 "87fe8c90ae6c6fd1e3aba5d99f954c8cb15a74d27e7087e939f80c89f93525b2"
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
