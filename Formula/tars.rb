class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.27.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.27.1/tars_0.27.1_darwin_arm64.tar.gz"
      sha256 "0fb5f59c5a816c1e7b73dd8fb0557cfbcefca3f26660c56388e73f84799359f1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.27.1/tars_0.27.1_darwin_amd64.tar.gz"
      sha256 "1f88a9bef261486b76d2e7889b9875d5674cbc1e70e4160c8663ad39200db8f9"
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
