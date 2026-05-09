class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.9/tars_0.32.9_darwin_arm64.tar.gz"
      sha256 "97fca4807e678ee0d23964e4adea9f08959fd0d38d91fa5889a07e10418655ef"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.9/tars_0.32.9_darwin_amd64.tar.gz"
      sha256 "38c893e84e4a2cc1313ed2ea51fa152c5d86f4479c2d139043742e431cd3f11f"
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
