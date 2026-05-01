class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.124"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.124/tars_0.31.124_darwin_arm64.tar.gz"
      sha256 "0567b1d5da81909d320dca6bd0bd577be7dcfa801773da74d2b72921affc8e8b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.124/tars_0.31.124_darwin_amd64.tar.gz"
      sha256 "7e4d84f68a2a3c181a4eff30b513b41ac7e6b9c3024e04ba3150ac0b9dc7acdc"
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
