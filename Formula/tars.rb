class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.143"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.143/tars_0.31.143_darwin_arm64.tar.gz"
      sha256 "8023d6b8164f1bb844fc728bd0046c5ef9db74dc86e99da6e79c0c3ee82d0326"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.143/tars_0.31.143_darwin_amd64.tar.gz"
      sha256 "9b9a4663170520d9830eb2da0eabbd63e7150b25021159b91413aed3fc1f0752"
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
