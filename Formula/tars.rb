class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.2/tars_0.40.2_darwin_arm64.tar.gz"
      sha256 "bd44d800fb8b96d79e2b2f911fa7d1a0029058c4a015342d3f0ada583342531f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.2/tars_0.40.2_darwin_amd64.tar.gz"
      sha256 "85516a54f42c5c6b3aa13bec5808f4c804b01b6038cd8dcfe88a136cad8e8866"
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
