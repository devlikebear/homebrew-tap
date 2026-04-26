class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.1/tars_0.31.1_darwin_arm64.tar.gz"
      sha256 "15e6e3de0a0d99a02a3f5a2f2fae716c9f8536727e6113d006f2597a952687e5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.1/tars_0.31.1_darwin_amd64.tar.gz"
      sha256 "0fdf723e251d183768cd972bd9819f123bb616c71fc444cbd4377ca15de8d6b0"
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
