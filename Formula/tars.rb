class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.62"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.62/tars_0.31.62_darwin_arm64.tar.gz"
      sha256 "ec6c3ff9ea25c06e55d117cf2d9bfaddb8d96b8339da226033d596019bb2fd0d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.62/tars_0.31.62_darwin_amd64.tar.gz"
      sha256 "96a47428692c062445a01d168c29266b581d35cb56344770297ddc6fc808c98e"
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
