class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.27.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.27.0/tars_0.27.0_darwin_arm64.tar.gz"
      sha256 "46042af1c2248f05e8fc6b80db23f99091fb0f5fc9e4de6a5032e1f947d58881"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.27.0/tars_0.27.0_darwin_amd64.tar.gz"
      sha256 "dba66980ac06a2e99762db9bad561e5b3df7076b4f1de83926e769bc95c0bae9"
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
