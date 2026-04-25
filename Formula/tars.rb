class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.28.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.28.3/tars_0.28.3_darwin_arm64.tar.gz"
      sha256 "491cf3fb398d6018dbc7668e07d16efd52c317ff7c762d353f91909f2cc021a2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.28.3/tars_0.28.3_darwin_amd64.tar.gz"
      sha256 "e28f9d387e7cb33aa4df3e9f5d7988bb8383c205873c0716e0e1bf2adbad7f9b"
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
