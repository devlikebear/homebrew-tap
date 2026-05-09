class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.14/tars_0.32.14_darwin_arm64.tar.gz"
      sha256 "7b74d1cb2504d53c8f3adbf52ebc9bc93541a133a6102afb0a7e4e9ba854aaab"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.14/tars_0.32.14_darwin_amd64.tar.gz"
      sha256 "ba45556174fe1f20f0d2bd7cce8eb31f6a5fde03833e9d26661cfd745ba072eb"
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
