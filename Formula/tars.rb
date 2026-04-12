class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.26.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.26.0/tars_0.26.0_darwin_arm64.tar.gz"
      sha256 "ee8999152e98eccddb99eabfa9c9aba7661669b93d30fcb1c20fbf87ad70ab74"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.26.0/tars_0.26.0_darwin_amd64.tar.gz"
      sha256 "f27023961308fa45e27444b960ef9c35d6d202a4dc67e8d6c9457f11be68fce6"
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
