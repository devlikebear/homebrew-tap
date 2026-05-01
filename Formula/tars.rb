class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.111"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.111/tars_0.31.111_darwin_arm64.tar.gz"
      sha256 "349b6a9e69e3c9ada99335b88991177eb13f376709f12a51c1454a2546fb39bc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.111/tars_0.31.111_darwin_amd64.tar.gz"
      sha256 "0bbd46b6651e007ae0c7d54ce83d68d5d069a443999d93771a2204465ac7ce48"
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
