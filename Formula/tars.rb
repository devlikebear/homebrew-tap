class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.129"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.129/tars_0.31.129_darwin_arm64.tar.gz"
      sha256 "6c326d57f01a9f8cdb2dbc65f73cd009fd20dd8e6dc98aed32ee8f544385c5dd"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.129/tars_0.31.129_darwin_amd64.tar.gz"
      sha256 "fd3cd01cae5ca773bf876e0afca3a60af3ffe746c5226bd8ce596ff89fb7bc59"
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
