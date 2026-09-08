class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.37.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.37.0/tars_0.37.0_darwin_arm64.tar.gz"
      sha256 "39a0f5ad7fb4c2d12f29a1379dc553a4985a1197dbedc51514b998e072a751d2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.37.0/tars_0.37.0_darwin_amd64.tar.gz"
      sha256 "4a3aaadba1a66a62a62c0c7b156a5d897b01d9236c7403b66808ca094a18f2b7"
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
