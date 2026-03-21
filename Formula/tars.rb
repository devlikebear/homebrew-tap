class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.8.0/tars_0.8.0_darwin_arm64.tar.gz"
      sha256 "b04c63880f6130f78db73723ddc7a9fe213c82b4d48713d78d1074fe4c95f23a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.8.0/tars_0.8.0_darwin_amd64.tar.gz"
      sha256 "36d39a55f354438ce665229a800dd10733a0dcf6b2c509f9f15c08f3d4d6c4c1"
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
