class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.151"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.151/tars_0.31.151_darwin_arm64.tar.gz"
      sha256 "2b37bee7056f8929c5474e627344fb27575dff183a04def96c7651c0c210e0ea"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.151/tars_0.31.151_darwin_amd64.tar.gz"
      sha256 "17eecda92d85e29ea815082c3316b4a3076ed5a90f343d51ce2abb64158faa43"
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
