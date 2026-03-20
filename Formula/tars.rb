class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.6.1/tars_0.6.1_darwin_arm64.tar.gz"
      sha256 "da967e3c5dfc8b557b9a491d0e647dbedc6562e1ee8a9b5cd41eadd6aa276c92"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.6.1/tars_0.6.1_darwin_amd64.tar.gz"
      sha256 "b246b67d2a598619797fc48141c70f03ea1c5b6a15aab9978e197c7240432be1"
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
