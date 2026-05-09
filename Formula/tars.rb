class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.7/tars_0.32.7_darwin_arm64.tar.gz"
      sha256 "93ba1d270c3d68e2f0eb1c7f22d125591985fbc2df41356b5df85a892b6c4be3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.7/tars_0.32.7_darwin_amd64.tar.gz"
      sha256 "1f81e56d7359adb197e67404823be5c2fd64bf5cabd5ed767dccfcef2a40e798"
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
