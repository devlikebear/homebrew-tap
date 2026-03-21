class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.6.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.6.3/tars_0.6.3_darwin_arm64.tar.gz"
      sha256 "9acd30a7b0ec4e0471e48e293edfc91b2f87134fddc0294b1c38182a5c261ce6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.6.3/tars_0.6.3_darwin_amd64.tar.gz"
      sha256 "95ca9fd420db4f82bf49945dc91afcce6400d57d3c577fc63158d638b5d4d8ba"
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
