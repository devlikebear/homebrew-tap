class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.152"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.152/tars_0.31.152_darwin_arm64.tar.gz"
      sha256 "dd7ecf6416939879aad58b01e3e795dcc32c568d2f9f810e3218dd6fc4848574"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.152/tars_0.31.152_darwin_amd64.tar.gz"
      sha256 "dfe4769d403bcf42413def50e624a366356be67795dd3ec6081669cf7c916e4b"
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
