class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.114"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.114/tars_0.31.114_darwin_arm64.tar.gz"
      sha256 "9c73039afc1b645bb3105a3d3c66d91bfe97ce4c9ce1a02809bb8d997462ab58"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.114/tars_0.31.114_darwin_amd64.tar.gz"
      sha256 "5d6f305d4fb664b16347b33d170dabdc0d1c182aa3d1272674e8af5ae5b4957b"
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
