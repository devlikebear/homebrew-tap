class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.17/tars_0.32.17_darwin_arm64.tar.gz"
      sha256 "bfb76cfeb6037e2c2c994c2619ff5cbac51818e459c136c453fe53a580cf1e90"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.17/tars_0.32.17_darwin_amd64.tar.gz"
      sha256 "4f3f8190d1260383bf9dc339a5df2e741b92d2019d7446dfd47b9219bf9214dc"
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
