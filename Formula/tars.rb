class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.37/tars_0.31.37_darwin_arm64.tar.gz"
      sha256 "e3c2eb26952f880e6e9a9e66f8d11991072960e93aa33911ce26892da2443c63"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.37/tars_0.31.37_darwin_amd64.tar.gz"
      sha256 "fdd86b3655e637db4a8510542ae48b23208a8bba3f36774d235ebcbab2f9b5f4"
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
