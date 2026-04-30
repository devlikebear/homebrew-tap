class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.67"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.67/tars_0.31.67_darwin_arm64.tar.gz"
      sha256 "9feac198cf9b04a2867a5eaf95f2bb6e34ed8543a28da3028701a8b25f205081"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.67/tars_0.31.67_darwin_amd64.tar.gz"
      sha256 "8b1e98b0da73e447ee7e36b3dbfd3c9e264498fc028dff59e0325cace3102519"
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
