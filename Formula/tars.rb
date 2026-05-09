class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.15/tars_0.32.15_darwin_arm64.tar.gz"
      sha256 "7182e702f4f034f7c53f5a2a00ebe07b490d5303f2694623408243807cf9f20d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.15/tars_0.32.15_darwin_amd64.tar.gz"
      sha256 "1c57c874b184eab31bc692ccff09902147486dde4bc54320ab4142747f49b306"
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
