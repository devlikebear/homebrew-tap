class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.43/tars_0.31.43_darwin_arm64.tar.gz"
      sha256 "5b82f8a6d7708dc974118b35e378e5223e1d3a0d6b740937e5d9dda5a380d865"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.43/tars_0.31.43_darwin_amd64.tar.gz"
      sha256 "02eeadac62d542f5ed9dc20379160863118fc40b643461dd536e46eafd03b60f"
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
