class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.46"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.46/tars_0.32.46_darwin_arm64.tar.gz"
      sha256 "12d61c173ec8e0d9cdf331847ec9b0d7232a56d6c49591c4845b977d3af0b6bc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.46/tars_0.32.46_darwin_amd64.tar.gz"
      sha256 "ac0950bd8038184fb4251eb88f0d60727ae7efdc566673ec8aee1c4d87934634"
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
